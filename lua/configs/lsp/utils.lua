local module = {}

local registered_sources = {}

module.use_null_ls_source = function(sources)
  local null_ls = require("null-ls")
  for _, source in ipairs(sources) do
    local methods = type(source.method) == "string" and source.method
      or table.concat(source.method, " ")
    local key = source.name .. methods
    if not registered_sources[key] then
      registered_sources[key] = source
      null_ls.register(source)
    else
      vim.notify(
        string.format(
          "Attempted to register a duplicate null_ls source. ( %s with methods %s).",
          source.name,
          methods
        ),
        vim.log.levels.WARN
      )
    end
  end
end

module.use_null_ls = function(package_name, null_ls_path, configure_function)
  vim.notify(("null_ls|setup `%s`"):format(null_ls_path), vim.log.levels.INFO)

  local ok, null_ls = pcall(require, "null-ls")
  if not ok then
    vim.notify("null-ls not found, please install it.", vim.log.levels.ERROR)
    return
  end

  local start_null_ls = function()
    local path = vim.split(null_ls_path, "%.", nil)
    if #path ~= 3 then
      vim.notify(
        ("Error setting up null-ls provider `%s`.\n\n  null_ls_path should have 3 segments i.e. `builtins.formatting.stylua`"):format(null_ls_path),
        vim.log.levels.ERROR
      )
      return
    end
    local provider = null_ls[path[1]][path[2]][path[3]]

    if configure_function then
      provider = configure_function(provider)
    end

    module.use_null_ls_source({ provider })
  end

  local on_error = function(_, message)
    vim.notify(("There was an error setting up null_ls provider `%s`. Reason: \n%s"):format(null_ls_path, message), vim.log.levels.ERROR)
  end

  if package_name then
    module.use_mason_package(package_name, start_null_ls, on_error)
  else
    vim.defer_fn(function()
      start_null_ls()
    end, 1)
  end
end

module.use_mason_package = function(package_name, success_handler, error_handler)
  local mason = require("mason-registry")
  local on_err = error_handler or function(pkg_name, err_msg)
    error(("Error installing mason package `%s`.  Reason: \n%s "):format(pkg_name, err_msg))
  end

  if not package_name then
    on_err("nil", "No package_name provided.")
    return
  end

  vim.notify("mason|using package " .. package_name, vim.log.levels.INFO)

  local ok, err = xpcall(function()
    mason.refresh(function()
      local package = mason.get_package(package_name)
      if not package:is_installed() then
        package:install()
        package:on("install:success", function()
          vim.schedule(function()
            success_handler(package)
          end)
        end)
        package:on("install:failed", function(pkg)
          vim.schedule(function()
            on_err(package_name, "Mason.nvim install failed.  Reason:\n" .. pkg.stderr)
          end)
        end)
      else
        success_handler(package)
      end
    end)
  end, debug.traceback)

  if not ok then
    on_err(package_name, "There was an unknown error when installing.  Reason: \n" .. err)
  end
end

module.use_lsp_mason = function(lsp_name, options)
  vim.notify(("lsp|setup `%s`"):format(lsp_name), vim.log.levels.INFO)

  local lsp = require("lspconfig")
  local opts = options or {}
  local config_name = opts.name or lsp_name
  local user_config = opts.config or {}

  local capabilities_config = {
    capabilities = module.get_capabilities(),
  }

  local start_lsp = function()
    local final_config = vim.tbl_deep_extend("keep", user_config, capabilities_config)
    if lsp[config_name] and lsp[config_name].setup then
      lsp[config_name].setup(final_config)
    else
      vim.notify(("LSP config %s is missing setup function."):format(config_name), vim.log.levels.WARN)
    end
  end

  if not opts.no_installer then
    local lspconfig_to_package = require("mason-lspconfig.mappings.server").lspconfig_to_package
    module.use_mason_package(lspconfig_to_package[lsp_name], start_lsp)
  else
    start_lsp()
  end
end

module.get_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

module.wrap_language_setup = function(module_name, setup_fn)
  local setup_language = function()
    vim.defer_fn(function()
      local ok, error = xpcall(setup_fn, debug.traceback)
      if not ok then
        vim.notify(("Error setting up language `%s`. \n%s"):format(module_name, error), vim.log.levels.ERROR)
      end
    end, 1)
  end
  return setup_language
end

return module

local M = {}

---@param opts conform.setupOpts
function M.setup(_, opts)
  require("conform").setup({
    format_on_save = function(bufnr)
      if vim.g.format_disable or vim.b[bufnr].format_disable then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
      event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  })

  vim.g.format_enable = true 
  vim.g.format_disable = false
  
  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.g.format_enable = true
    vim.g.format_disable = false
  end, {
    desc = "Enable autoformat globally",
  })

  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      vim.b.format_disable = true
    else
      vim.g.format_disable = true
      vim.g.format_enable = false
    end
  end, {
    desc = "Disable autoformat globally or for the current buffer",
    bang = true,

  })
end

return M


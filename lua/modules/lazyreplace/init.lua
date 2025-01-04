local lazyreplace = {}

lazyreplace.replace = function()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then
    vim.notify("Telescope is not installed. Please install Telescope to use LazyReplace.", vim.log.levels.ERROR)
    return
  end

  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local sorters = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  pickers.new({}, {
    prompt_title = "Enter <term to replace> <replacement term>",
    finder = finders.new_table({
      results = {},
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry,
          ordinal = entry,
        }
      end
    }),
    sorter = sorters.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local input = action_state.get_current_line()
        actions.close(prompt_bufnr)

        local search_term, replace_term = input:match("^(%S+)%s+(%S+)$")
        if not search_term or not replace_term then
          vim.notify("Both search term and replacement term must be provided.", vim.log.levels.ERROR)
          return
        end

        pickers.new({}, {
          prompt_title = "Search and Replace in Project",
          finder = finders.new_oneshot_job({
            "rg", "--files-with-matches", "--column", "--line-number", "--ignore-case", search_term
          }, {
            entry_maker = function(entry)
              return {
                value = entry,
                display = entry,
                ordinal = entry,
              }
            end
          }),
          sorter = sorters.generic_sorter({}),
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = action_state.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)

              local command = string.format(
                [[silent !rg --ignore-case --files-with-matches "%s" | xargs sed -i 's/%s/%s/g']],
                vim.fn.escape(selection.value, '"'),
                vim.fn.escape(search_term, '/'),
                vim.fn.escape(replace_term, '/')
              )

              local ok, err = pcall(vim.cmd, command)
              if ok then
                vim.notify("Successfully replaced occurrences of the term in the project.", vim.log.levels.INFO)
              else
                vim.notify("Error executing project-wide replace: " .. err, vim.log.levels.ERROR)
              end
            end)

            return true
          end
        }):find()
      end)

      return true
    end
  }):find()
end

lazyreplace.replace_all = function()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then
    vim.notify("Telescope is not installed. Please install Telescope to use LazyReplaceAll.", vim.log.levels.ERROR)
    return
  end

  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local sorters = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  pickers.new({}, {
    prompt_title = "Enter <term to replace> <replacement term>",
    finder = finders.new_table({
      results = {},
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry,
          ordinal = entry,
        }
      end
    }),
    sorter = sorters.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local input = action_state.get_current_line()
        actions.close(prompt_bufnr)

        local search_term, replace_term = input:match("^(%S+)%s+(%S+)$")
        if not search_term or not replace_term then
          vim.notify("Both search term and replacement term must be provided.", vim.log.levels.ERROR)
          return
        end

        local command = string.format(
          [[silent !rg --ignore-case --files-with-matches "%s" | xargs sed -i 's/%s/%s/g']],
          vim.fn.escape(search_term, '"'),
          vim.fn.escape(search_term, '/'),
          vim.fn.escape(replace_term, '/')
        )

        local ok, err = pcall(vim.cmd, command)
        if ok then
          vim.notify("Successfully replaced all occurrences of the term in the project.", vim.log.levels.INFO)
        else
          vim.notify("Error executing project-wide replace: " .. err, vim.log.levels.ERROR)
        end
      end)

      return true
    end
  }):find()
end

lazyreplace.setup = function()
  vim.api.nvim_create_user_command("LazyReplace", lazyreplace.replace, {})
  vim.api.nvim_create_user_command("LazyReplaceAll", lazyreplace.replace_all, {})
end

return lazyreplace

---@type YaziConfig
local yazi_config = {
  keys = {
    {
      "<leader>uu",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- NOTE: this requires a version of yazi that includes
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },

  open_for_directories = false,
  open_multiple_tabs = false,

  highlight_groups = {
    hovered_buffer = nil,
    hovered_buffer_in_same_directory = nil,
  },

  floating_window_scaling_factor = 0.9,
  yazi_floating_window_winblend = 0,
  log_level = vim.log.levels.OFF,

  open_file_function = function(chosen_file, config, state)
    -- Custom behavior for opening files
  end,

  keymaps = {
    show_help = "<f1>",
    open_file_in_vertical_split = "<c-v>",
    open_file_in_horizontal_split = "<c-x>",
    open_file_in_tab = "<c-t>",
    grep_in_directory = "<c-s>",
    replace_in_directory = "<c-g>",
    cycle_open_buffers = "<tab>",
    copy_relative_path_to_selected_files = "<c-y>",
    send_to_quickfix_list = "<c-q>",
    change_working_directory = "<c-\\>",
  },

  set_keymappings_function = function(yazi_buffer_id, config, context)
    -- Custom behavior for setting keymappings
  end,

  yazi_floating_window_border = "rounded",
  clipboard_register = "*",

  hooks = {
    yazi_opened = function(preselected_path, yazi_buffer_id, config)
      -- Behavior when yazi is opened
    end,

    yazi_closed_successfully = function(chosen_file, config, state)
      -- Behavior when yazi closes successfully
    end,

    yazi_opened_multiple_files = function(chosen_files, config, state)
      -- Behavior when multiple files are opened
    end,
  },

  highlight_hovered_buffers_in_same_directory = true,

  integrations = {
    grep_in_directory = function(directory)
      -- Custom grep integration for directories
    end,
    grep_in_selected_files = function(selected_files)
      -- Custom grep integration for selected files
    end,
    replace_in_directory = function(directory)
      -- Custom replace integration for directories
    end,
    replace_in_selected_files = function(selected_files)
      -- Custom replace integration for selected files
    end,
    resolve_relative_path_application = "",
  },

  future_features = {
    ya_emit_reveal = false,
    ya_emit_open = false,
  },
}

return yazi_config


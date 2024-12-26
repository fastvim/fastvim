local autosave = {
  enabled = true, 
  trigger_events = { 
    immediate_save = { "BufLeave", "FocusLost" }, 
    defer_save = { "InsertLeave", "TextChanged" }, 
    cancel_deferred_save = { "InsertEnter" }, 
  },
  condition = nil,
  write_all_buffers = false, 
  noautocmd = false, 
  lockmarks = false, 
  debounce_delay = 1000, 
  debug = false,
}
return autosave

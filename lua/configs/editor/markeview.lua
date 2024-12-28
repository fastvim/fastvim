local markd = {
    buf_ignore = { "nofile" },
    debounce = 50,
    filetypes = { "markdown", "quarto", "rmd" },
    highlight_groups = "dynamic",
    hybrid_modes = nil,
    injections = {},
    initial_state = true,
    max_file_length = 1000,
    modes = { "n", "no", "c" },
    render_distance = 100,
    split_conf = {},
    block_quotes = {},
    callbacks = {},
    checkboxes = {},
    code_blocks = {},
    escaped = {},
    footnotes = {},
    headings = {},
    horizontal_rules = {},
    html = {},
    inline_codes = {},
    latex = {},
    links = {},
    list_items = {},
    tables = {}
}

return markd

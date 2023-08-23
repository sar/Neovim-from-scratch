local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
   return
end

local opts = {
    backends = { "treesitter", "lsp", "markdown" },
    layout = {
        max_width = { 48 },
        width = 48,
        min_width = 48,
        default_direction = "prefer_right",
        placement = "edge",
    },
    attach_mode = "global",
    lazy_load = true,
    filter_kind = false,
    highlight_closest = true,
    manage_folds = false,
    open_automatic = false,
    show_guides = true,
    lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
        update_delay = 300,
    },
    treesitter = {
        update_delay = 300,
    },
    markdown = {
        update_delay = 300,
    }
}

aerial.setup(opts)


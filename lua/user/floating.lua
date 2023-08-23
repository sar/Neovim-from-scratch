-- overrides
local util_float = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    -- opts.focusable = false
    opts.focusable = opts.focusable or false
    local bufnr, winnr = util_float(contents, syntax, opts, ...)
    return bufnr, winnr
end

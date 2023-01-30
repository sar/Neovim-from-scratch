local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
   return
end

trouble.after('nvim-lspconfig');

local opts = {
    position = "bottom",
    mode = "workspace_diagnostics",
    height = 3,
    width = 60,
    group = true,
    padding = true,
    auto_open = true,
    auto_close = false,
    auto_preview = true,
    icons = true,
    fold_open = "v",
    fold_closed = ">",
    indent_lines = true,
    signs = {
        error = "[E]",
        warning = "[W]",
        hint = "[h]",
        information = "[i]",
    },
    use_diagnostic_signs = true,
}

trouble.setup(opts);

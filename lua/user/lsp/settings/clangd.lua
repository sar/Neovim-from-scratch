local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, _extensions = pcall(require, "clangd_extensions")
if not status_ok then
    return
end

_extensions.setup {
    server = {
        offsetEncoding = "utf-16",
        capabilities = {
            offsetEncoding = "utf-16"
        }
    },
}

local lsp_servers_path = "/home/env/.local/share/nvim/lsp_servers"
local clangd_path = lsp_servers_path .. "/clangd/clangd/bin/clangd"

local opts = {
    cmd = {
        clangd_path,
        '--offset-encoding=utf-16',
        '--background-index',
        '--clang-tidy',
        '--all-scopes-completion',
        '--completion-style=detailed',
        '--suggest-missing-includes',
        '--cross-file-rename'
    },
}

_.clangd.setup(opts)

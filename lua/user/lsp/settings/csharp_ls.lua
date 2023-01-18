local lsp_servers_path = "/home/env/.local/share/nvim/lsp_servers"
local csharp_ls_path = lsp_servers_path .. "/csharp_ls/csharp_ls"
-- local capabilities = require('cmp_nvim_lsp')
--     .update_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require 'lspconfig.util'

return {
    default_config = {
        cmd = { csharp_ls_path },
        root_dir = util.root_pattern('*.sln', '*.csproj', '.git'),
        filetypes = { 'cs' },
        init_options = {
            AutomaticWorkspaceInit = true,
        },
    },
}

-- require "lspconfig".csharp_ls.setup {
--     cmd = { csharp_ls_path },
--     capabilities = capabilities,
-- }


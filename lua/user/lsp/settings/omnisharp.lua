-- lspconfig:omnisharp:use_mono
local lsp_servers_path = "/home/env/.local/share/nvim/lsp_servers"
local omnisharp_path = lsp_servers_path .. "/omnisharp/omnisharp/OmniSharp"

vim.g.OmniSharp_highlight_groups = {
    EnumMemberName = 'EnumMemberField',
    Operator = 'OperatorPunctuation',
    Keyword = 'CsKeyword',
    ControlKeyword = 'CsControlKeyword',
}

require "lspconfig".omnisharp.setup {
    use_mono = false,
    -- mono_cmd = "/usr/bin/mono",
    cmd = { "dotnet", omnisharp_path },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
}

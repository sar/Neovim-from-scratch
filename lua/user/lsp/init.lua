local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- require "user.lsp.mason"
-- require "user.lsp.lsp-installer"   -- deprecated
-- require("user.lsp.handlers").setup()
require "user.lsp.lsp_setup"
require "user.lsp.null-ls"
require "user.lsp.settings.csharp_ls"
require "user.lsp.settings.omnisharp"
require "user.lsp.settings.inlay_ls"
-- require "user.lsp.settings.refactor"
-- require "user.lsp.settings.clangd"

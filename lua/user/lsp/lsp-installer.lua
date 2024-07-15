local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {
    "bashls",
    "cmake",
    "clangd",
    "ccls",
    "csharp_ls",
    "dockerls",
    "eslint",
    "graphql",
    "html",
    "cssls",
    "jsonls",
    "marksman",
    "remark_ls",
    "terraformls",
    "tflint",
    "lua_ls",
    "sumneko_lua",
    "lemminx",        -- WARN: binary
    "sqlls",
    "pylsp",
    "pyright",
    "sourcery",
    -- "ansiblels",   -- BUG: fails to install
    -- "rome",        -- BUG: logs errors
    "tsserver",
    "yamlls",
}

-- Install declared LSP servers
local lsp_installer_servers = require("nvim-lsp-installer.servers")
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function()
            -- Invoke server args
            local opts = {
                github = {
                    download_url_template = "https://github.com/clangd/clangd/releases/download/snapshot_20240128/clangd-linux-snapshot_20240128.zip"
                }
            }
            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue server installation
            server:install()
        end
    end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "lua_ls" then
        local sumneko_opts = require("user.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "clangd" then
        local clangd_opts = require("user.lsp.settings.clangd")
        opts = vim.tbl_deep_extend("force", clangd_opts, opts)
    end

    if server.name == "csharp_ls" then
        local csharp_opts = require("user.lsp.settings.csharp_ls")
        opts = vim.tbl_deep_extend("force", csharp_opts, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

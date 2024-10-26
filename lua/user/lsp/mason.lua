local servers = {
  "bashls",
  "cmake",
  "clangd",
  "ccls",
  "csharp_ls",
  "dockerls",
  "editorconfig-checker",
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
  "lemminx", -- WARN: binary
  "sqlls",
  "pylsp",
  "pyright",
  "sourcery",
  "tsserver",
  "yamlls",
}

local formatters = {
  "eslint_d",
  "prettierd",
  "shellcheck",
}

local settings = {
  servers = servers,
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- require('formatter').setup({
--   logging = true,
--   filetype = {
--     javascript = {
--       function()
--         return {
--           exe = "prettier",
--           args = { '--write ', vim.api.nvim_buf_get_name(0) },
--           stdin = false
--         }
--       end
--     },
--     -- other formatters ...
--   }
-- })

local prettier = require("prettier")
prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    config_precedence = "prefer-file",
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      return true
    end,
    timeout = 5000,
  }
})

-- local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

-- if not lspconfig_status_ok then
--     return
-- end
--
-- local opts = {}
-- for _, server in pairs(servers) do
--     opts = {
--         on_attach = require("user.lsp.handlers").on_attach,
--         capabilities = require("user.lsp.handlers").capabilities,
--
--
--     server = vim.split(server, "@")[1]
--
--     local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
--     if require_ok then
--         opts = vim.tbl_deep_extend("force", conf_opts, opts)
--     end
--
--     lspconfig[server].setup(opts)
-- end

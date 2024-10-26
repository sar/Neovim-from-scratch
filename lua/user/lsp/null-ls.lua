local null_ls_status_ok, null_ls = pcall(require, "none-ls")
if not null_ls_status_ok then
  return
end

local typescript = require('typescript.extensions.null-ls.code-actions')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

-- eslint_d has_eslint_config
local has_eslint_config = function(u)
  return u.root_has_file('.eslintrc')
      or u.root_has_file('.eslintrc.json')
      or u.root_has_file('.eslintrc.js')
      or u.root_has_file('.eslintrc.cjs')
      or u.root_has_file('.eslintrc.yaml')
      or u.root_has_file('.eslintrc.yml')
      or u.root_has_file('eslint.config.js')
      or u.root_has_file('package.json')
end

null_ls.setup({
  debug = true,
  sources = {
    -- prettier
    -- extra_args = { "--single-quote", "--jsx-single-quote" },
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),

    -- typescript
    -- typescript,

    -- eslint_d
    code_actions.eslint_d.with({
      condition = has_eslint_config,
      prefer_local = "node_modules/.bin",
    }),
    diagnostics.eslint_d.with({
      condition = has_eslint_config,
      prefer_local = "node_modules/.bin",
    }),
    formatting.eslint_d.with({
      condition = has_eslint_config,
      prefer_local = "node_modules/.bin",
    }),

    -- clangd
    formatting.clang_format.with({
      extra_args = {
        "-style=file",
        ".clang-format",
        "--indent-type",
        "Spaces"
      },
    }),

    -- formatting
    formatting.black.with({ extra_args = { "--fast" } }),

    -- completion
    -- completion.spell,

    -- code_actions
    code_actions.gitsigns,

    -- diagnostics
    diagnostics.markdownlint,
  },
})

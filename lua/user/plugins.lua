local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/sar/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- packer::popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- opts:imports
-- WARN: imports not used
local opts_symbols = require("user.symbols-outline")
local opts_feline = require("user.feline")

-- Plugins --
return packer.startup(function(use)
    -- base --
    use "sar/packer.nvim" -- packer
    use "sar/plenary.nvim" -- lua functions
    use "sar/impatient.nvim" -- perf
    use "sar/bbye.nvim" -- wm state

    -- interface --
    use "sar/extra-darkplus.nvim" -- theme
    use "sar/web-devicons.nvim" -- icons
    use "sar/alpha.nvim" -- greeter
    -- use "sar/scrollbar.nvim"          -- scrollbar
    use "sar/bufferline.nvim" -- tab area
    -- use "sar/sidebar.nvim"         -- sidebar
    use "sar/lualine.nvim" -- footer
    use "sar/tree.nvim" -- nvim-tree
    use "sar/toggleterm.nvim" -- terminal
    use "sar/popup.nvim" -- popup api
    use "sar/indent-blankline.nvim" -- indent blankine

    -- tools --
    use "sar/project.nvim" -- projects
    use "sar/telescope.nvim" -- telescope
    use "sar/which-key.nvim" -- keymaps

    -- feline
    -- use {
    --   "sar/feline.nvim",
    --   config = function() require("feline").setup({
    --     preset = "noicon",
    --     theme = {
    --       bg = "#000000",
    --       fg = "#040404",
    --     },
    --   }) end,
    -- }

    -- symbols-outline
    use {
        "sar/symbols-outline.nvim",
        after = "nvim-lspconfig",
        config = function() require("symbols-outline").setup({
                position = "right",
                width = 32,
                relative_width = false,
                auto_close = false,
                show_numbers = false,
                auto_preview = false,
            })
        end,
    }

    -- bufferline plugin::tab options
    use {
        "sar/barbar.nvim",
        requires = { "sar/web-devicons.nvim" },
        config = function() require('bufferline').setup {
                tabpages = true,
                insert_at_end = true,
            }
        end,
    }

    -- BUG: nvim >= 0.8
    -- use "sar/navic.nvim"
    -- symbols navigation
    -- use {
    --   "sar/barbecue.nvim",
    --   requires = {
    --       "neovim/nvim-lspconfig",
    --       "sar/navic.nvim",
    --       "sar/web-devicons.nvim"
    --   },
    --   config = function() require('barbecue').setup {} end,
    -- }

    use {
        "sar/image.nvim",
        requires = { "sar/plenary.nvim" },
        config = function() require('image').setup {} end,
    }

    -- BUG:unstable
    -- neotree
    -- use {
    --   "sar/neo-tree.nvim",
    --   branch = "main",
    --   requires = {
    --     "sar/plenary.nvim",
    --     "sar/nvim-web-devicons",
    --     "sar/nui.nvim"
    --   },
    --   config = function() require("neo-tree").setup {
    --     filesystem = {
    --       window = {
    --         mappings = {
    --           ["/"] = "filter_as_you_type",
    --         },
    --       },
    --     },
    --   } end,
    -- }

    -- actions --
    use "sar/comment.nvim" -- auto comment
    use "sar/ts-comment.nvim" -- ts comment

    -- autosave
    use {
        "sar/autosave.nvim",
        config = function() require("autosave").setup {
                debounce_delay = 1024,
            }
        end,
    }

    -- treesitter:syntax highlighting
    use {
        "sar/treesitter.nvim",
        run = ":TSUpdate",
    }

    -- treesitter:extension:indent formatter
    use {
        "sar/yati.nvim",
        requires = "sar/treesitter.nvim",
    }

    -- folke/todo-comments
    use {
        "sar/todo-comments.nvim",
        requires = "sar/plenary.nvim",
        config = function() require("todo-comments").setup() end,
    }

    -- sar/renamer.nvim
    use {
        "sar/renamer.nvim",
        branch = "master",
        requires = "sar/plenary.nvim",
        config = function() require("renamer").setup() end,
    }

    -- sar/trouble.nvim
    use {
        "sar/trouble.nvim",
        requires = "sar/nvim-web-devicons",
        config = function() require("trouble").setup {
                position = "right",
                mode = "document_diagnostics",
                height = 12,
                width = 80,
                auto_open = false,
                auto_close = false,
                auto_preview = false,
                icons = true,
                fold_open = "v",
                fold_closed = ">",
                indent_lines = false,
                signs = {
                    error = "[E]",
                    warning = "[W]",
                    hint = "[h]",
                    information = "[i]",
                },
                use_diagnostic_signs = true,
            }
        end,
    }

    -- diaglist.nvim
    use {
        "sar/diaglist.nvim",
        config = function() require('diaglist').init {
                debug = false,
                debounce_ms = 300,
            }
        end,
    }

    use {
        "sar/e-kaput.nvim",
        config = function() require('e-kaput').setup {
                enabled = true,
                transparency = 0,
                borders = true,
            }
        end,
    }

    -- BUG: method is declared twice
    -- code-actions.nvim
    use {
        "sar/code-actions.nvim",
        config = function() require('packer').use({
                'sar/code-actions.nvim',
                cmd = 'CodeActionMenu',
            })
        end,
    }

    -- debug adapter
    use "sar/dap.nvim"

    use {
        'sar/dap-ui.nvim',
        requires = { 'sar/dap.nvim' },
        config = function() require('dapui').setup {
                tray = {
                    elements = {},
                },
            }
        end,
    }

    -- use {
    --   "sar/dap-install.nvim",
    --   config = function() require("dap-install").setup {
    --       installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    --   } end,
    -- }

    use {
        'sar/dap-virtual-text.nvim',
        config = function() require('nvim-dap-virtual-text').setup {} end,
    }

    -- package-info
    use {
        "sar/package-info.nvim",
        requires = "sar/nui.nvim",
        config = function() require('package-info').setup() end,
    }

    use {
        "sar/docs-view.nvim",
        opt = true,
        cmd = { "DocsViewToggle" },
        config = function() require('nvim-docs-view').setup {
                position = "top",
                height = 60,
            }
        end,
    }

    -- spectre find_replace
    use {
        "sar/spectre.nvim",
        config = function() require('spectre').setup() end,
    }

    -- git --
    use "sar/gitsigns.nvim" 

    use {
        "sar/vgit.nvim",
        config = function() require('vgit').setup() end,
    }

    use {
        "sar/neogit.nvim",
        requires = "sar/plenary.nvim",
        config = function() require("neogit").setup() end,
    }

    -- gitui
    --use {
    --  "sar/gitui.nvim",
    --  config = function() require("gitui").setup {} end,
    --}

    -- gi vim
    -- use {
    --   "sar/gh.vim",
    --   config = function() require("gh").setup {} end,
    -- }

    use {
        "sar/git-conflict.nvim",
        config = function() require("git-conflict").setup {} end,
    }

    -- git::octo
    use {
        "sar/octo.nvim",
        requires = {
            "sar/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sar/web-devicons.nvim",
        },
        config = function() require("octo").setup() end,
    }

    -- git::diffview
    use {
        "sar/diffview.nvim",
        requires = "sar/plenary.nvim",
        config = function() require('diffview').setup {
                enhanced_diff_hl = true,
            }
        end,
    }

    -- http --

    use {
        "sar/rest.nvim",
        requires = "sar/plenary.nvim",
        config = function() require('rest-nvim').setup {
                highlight = {
                    enabled = true,
                },
                result = {
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                    formatters = {
                        json = '/tmp/jq',
                    },
                },
                env_file = '.env',
                encode_url = true,
                jump_to_request = true,
                result_split_in_place = true,
                skip_ssl_verification = true,
            }
        end,
    }

    -- database --

    -- psql (localhost only)
    -- use {
    --     "sar/psql.nvim",
    --     config = function() require("psql").setup {
    --             database_name = "postgres",
    --             close_latest_result = '<F32>',
    --             execute_line = '<F33>',
    --             execute_selection = '<F34>',
    --             execute_paragraph = '<F35>',
    --             close_all_results = '<F36>'
    --         }
    --     end,
    -- }

    use {
        "sar/pg.nvim",
        requires = {
            "sar/plenary.nvim",
            "sar/nui.nvim"
        },
    }

    use {
        "sar/preview-csv.nvim",
        config = function() require("nvim-preview-csv").setup {} end,
    }

    -- BUG: no split window found
    -- jupyter notebook
    -- use {
    --   "sar/jupyter-kit.nvim",
    -- }

    -- language support --

    -- snippets
    use "sar/autopairs.nvim" -- auto pair tags via treesitter,cmp
    use "sar/luasnip.nvim" -- snippet engine
    use "sar/friendly-snippets.nvim" -- additional snippets

    -- cmp::
    use "sar/cmp.nvim" -- completions engine
    use "sar/cmp-luasnip.nvim" -- cmp snippets
    use "sar/cmp-buffer.nvim" -- cmp buffer
    use "sar/cmp-path.nvim" -- cmp path
    use "sar/cmp-cmdline.nvim" -- cmp cmdline
    use "sar/cmp-lsp.nvim" -- cmp lsp
    use "sar/cmp-lua.nvim" -- cmp lua
    use {
        "sar/cmp-nuget", -- cmp nuget
        requires = "sar/plenary.nvim",
        config = function() require("cmp-nuget").setup {} end,
    }

    -- lsp::
    use "neovim/nvim-lspconfig" -- enable LSP
    use "sar/lsp-installer.nvim" -- language server installer
    use "sar/nlsp-settings.nvim" -- language server settings defined in json for
    use "sar/null-ls.nvim" -- for formatters and linters
    use "sar/schemastore.nvim" -- json extended schemas
    use "sar/csharpls-extended-lsp.nvim" -- csharp_ls extended decompile
    use "sar/lsp-overloads.nvim" -- csharp lsp overloads
    use "sar/omnisharp-extended-lsp.nvim" -- csharp omnisharp
    use {
        "sar/typescript.nvim", -- typescript
        config = function() require("typescript").setup {} end,
    }

    -- TODO: see docs to attach lsp.config
    use {
        "sar/inlay-hints.nvim", -- inlay parameter hints
        config = function() require('inlay-hints').setup {
                only_current_line = false,
                eol = {
                    right_align = true,
                }
            }
        end,
    }

    use {
        "sar/lsp_signature.nvim", -- overlay parameter hints
        config = function() require('lsp_signature').setup {
                bind = true,
                handler_opts = {
                    border = "rounded"
                }
            }
        end,
    }
    use "sar/lsp-progress.nvim" -- lsp progress

    -- refactor::
    use {
        "sar/refactoring.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "sar/treesitter.nvim",
        },
        config = function() require("refactoring").setup {} end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

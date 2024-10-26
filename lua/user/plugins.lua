local fn = vim.fn

local run_root = "/home/sar/.config/nvim/"

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    run_root .. "packer.nvim",
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

-- Plugins --
-- :PackerSync, :PackerInstall (local)
return packer.startup(function(use)
  -- base --
  use { run_root .. "packer.nvim" }    -- packer
  use { run_root .. "plenary.nvim" }   -- lua functions
  use { run_root .. "impatient.nvim" } -- perf
  use { run_root .. "vim-bbye" }       -- wm state

  -- interface --
  use { run_root .. "darkplusplus.nvim" } -- theme
  -- use { run_root .. "extra-darkplus.nvim" } -- theme
  -- use { run_root .. "ultra-darkplus.nvim" } -- theme
  use { run_root .. "nvim-web-devicons" } -- icons
  -- use { run_root .. "alpha-nvim" }        -- greeter
  use { run_root .. "nvim-scrollbar" }    -- scrollbar
  use { run_root .. "bufferline.nvim" }   -- tab area
  -- use { run_root .. "sidebar.nvim"         -- sidebar
  use { run_root .. "lualine.nvim" }      -- statusbar
  use { run_root .. "feline.nvim" }       -- statusbar
  use { run_root .. "nvim-tree.lua" }     -- nvim-tree
  use { run_root .. "toggleterm.nvim" }   -- terminal
  -- float term
  use {
    run_root .. "FTerm.nvim",
    config = function()
      require('FTerm').setup({
        cmd = '/bin/bash',
        dimensions = {
          height = 0.25,
          width = 0.25,
          x = 1,
          y = 1,
        },
      })
    end,
  }

  use { run_root .. "popup.nvim" }            -- popup api
  use { run_root .. "indent-blankline.nvim" } -- indent blankine
  use { run_root .. "vim-illuminate" }        -- highlighting

  -- tools --
  use { run_root .. "project.nvim" }   -- projects
  use { run_root .. "telescope.nvim" } -- telescope
  use { run_root .. "which-key.nvim" } -- keymaps

  -- symbols-outline
  use { run_root .. "symbols-outline.nvim" }
  use { run_root .. "aerial.nvim" }

  -- bufferline plugin::tab options
  use {
    run_root .. "barbar.nvim",
    requires = { run_root .. "nvim-web-devicons" },
    config = function()
      require('bufferline').setup {
        tabpages = true,
        insert_at_end = true,
      }
    end,
  }

  -- ui::symbols bar
  use {
    run_root .. "nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require('nvim-navic').setup {
        separator = " > ",
        depth_limit_indicator = "..",
      }
    end,
  }

  -- ui::barbecue
  use {
    run_root .. "barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      run_root .. "nvim-navic",
      run_root .. "nvim-web-devicons"
    },
    config = function() require('barbecue').setup {} end,
  }

  -- image
  use {
    run_root .. "image.nvim",
    requires = { run_root .. "plenary.nvim" },
    config = function() require('image').setup {} end,
  }

  -- neotree
  use {
    run_root .. "neo-tree.nvim",
    requires = {
      run_root .. "plenary.nvim",
      run_root .. "nvim-web-devicons",
      run_root .. "nui.nvim"
    },
  }

  -- actions --
  use { run_root .. "Comment.nvim" }

  -- autosave
  use {
    run_root .. "autosave.nvim",
    config = function()
      require("autosave").setup {
        debounce_delay = 1024,
      }
    end,
  }

  -- code folding
  use { run_root .. "promise-async" }
  use {
    run_root .. "nvim-ufo",
    require = {
      run_root .. "promise-async",
    },
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
  }

  -- treesitter:syntax highlighting
  use {
    run_root .. "nvim-treesitter",
    run = ":TSUpdate",
  }

  -- treesitter::comment strings::
  -- set vim.g.skip_ts_context_commenstring_module = true
  use {
    run_root .. "nvim-ts-context-commentstring",
    config = function() require("ts_context_commentstring").setup() end,
  }

  -- treesitter:extension:indent formatter
  use {
    run_root .. "nvim-yati",
    requires = run_root .. "nvim-treesitter",
  }

  -- folke/todo-comments
  use {
    run_root .. "todo-comments.nvim",
    requires = run_root .. "plenary.nvim",
    config = function() require("todo-comments").setup() end,
  }

  -- filipdutescu/renamer.nvim
  use {
    run_root .. "renamer.nvim",
    branch = "master",
    requires = run_root .. "plenary.nvim",
    config = function() require("renamer").setup() end,
  }

  -- folke/trouble.nvim
  use {
    run_root .. "trouble.nvim",
    requires = run_root .. "nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end,
  }

  -- diaglist.nvim
  use {
    run_root .. "diaglist.nvim",
    config = function()
      require('diaglist').init {
        debug = false,
        debounce_ms = 300,
      }
    end,
  }

  -- BUG: duplicated list items
  -- lsp_diagnostics float
  use {
    run_root .. "diag-float.nvim",
    config = function()
      require('e-kaput').setup {
        enabled = true,
        transparency = 0,
        borders = true,
      }
    end,
  }

  -- code-actions
  use {
    run_root .. "nvim-code-action-menu",
    cmd = 'CodeActionMenu',
  }

  -- debug adapter
  use { run_root .. "nvim-dap" }
  use {
    run_root .. "nvim-dap-ui",
    requires = { 'nvim-dap', 'nvim-nio' },
    config = function() require('dapui').setup {} end,
  }
  use { run_root .. "nvim-nio" } -- nvim-nio

  -- optional:: dap installer
  -- use {
  --   run_root .. "dap-install.nvim",
  --   config = function() require("dap-install").setup {
  --       installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
  --   } end,
  -- }

  -- dap virtual text
  use {
    run_root .. "nvim-dap-virtual-text",
    config = function() require('nvim-dap-virtual-text').setup {} end,
  }

  -- package-info
  use {
    run_root .. "package-info.nvim",
    requires = run_root .. "nui.nvim",
    config = function() require('package-info').setup() end,
  }

  -- documentation
  use {
    run_root .. "nvim-docs-view",
    opt = true,
    cmd = { "DocsViewToggle" },
    config = function()
      require('docs-view').setup {
        position = "top",
        height = 60,
      }
    end,
  }

  -- spectre find_replace
  use {
    run_root .. "nvim-spectre",
    config = function() require('spectre').setup() end,
  }

  -- git --
  use { run_root .. "gitsigns.nvim" }


  -- BUG: cloop failed
  -- use {
  --     run_root .. "vgit.nvim",
  --     config = function() require('vgit').setup() end,
  -- }

  -- use {
  --     run_root .. "neogit",
  --     requires = run_root .. "plenary.nvim",
  --     config = function() require("neogit").setup() end,
  -- }

  -- gitui
  --use {
  --  run_root .. "gitui.nvim",
  --  config = function() require("gitui").setup {} end,
  --}

  -- gi vim
  -- use {
  --   run_root .. "gh.nvim",
  --   config = function() require("gh").setup {} end,
  -- }

  -- git::git conflicts
  use {
    run_root .. "git-conflict.nvim",
    config = function() require("git-conflict").setup {} end,
  }

  -- git::octo
  use {
    run_root .. "octo.nvim",
    requires = {
      run_root .. "plenary.nvim",
      run_root .. "telescope.nvim",
      run_root .. "nvim-web-devicons",
    },
    config = function() require("octo").setup() end,
  }

  -- git::diffview
  -- use {
  --     run_root .. "diffview.nvim",
  --     requires = run_root .. "plenary.nvim",
  --     config = function() require('diffview').setup {
  --             enhanced_diff_hl = true,
  --         }
  --     end,
  -- }

  -- github codesearch
  -- run make manually
  -- use {
  --     run_root .. "nvim-github-codesearch",
  --     -- run = "make",
  --     config = function() require("nvim-github-codesearch").setup {
  --         use_telescope = true,
  --     } end,
  -- }

  -- http --

  use {
    run_root .. "rest.nvim",
    requires = run_root .. "plenary.nvim",
    config = function()
      require('rest-nvim').setup {
        highlight = {
          enabled = true,
        },
        result = {
          show_url = true,
          show_http_info = true,
          show_headers = true,
          formatters = {
            json = '/usr/bin/jq',
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
  --     run_root .. "psql.nvim",
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
    run_root .. "pg.nvim",
    requires = {
      run_root .. "plenary.nvim",
      run_root .. "nui.nvim"
    },
  }

  use {
    run_root .. "nvim-preview-csv",
    config = function() require("nvim-preview-csv").setup {} end,
  }

  -- BUG: no split window found
  -- jupyter notebook
  -- use {
  --   run_root .. "jupyter-kit.nvim",
  -- }

  -- language support --

  -- snippets
  use { run_root .. "nvim-autopairs" }    -- auto pair tags via treesitter,cmp
  use { run_root .. "LuaSnip" }           -- snippet engine
  use { run_root .. "friendly-snippets" } -- additional snippets

  -- uses thread -> sqlite,python3
  -- coq::
  -- use { run_root .. "coq.nvim" } -- alternate completions
  -- use { run_root .. "coq-artifacts.nvim"
  -- use { run_root .. "coq-thirdparty.nvim"

  -- cmp::
  use { run_root .. "nvim-cmp" }     -- completions engine
  use { run_root .. "cmp_luasnip" }  -- cmp snippets
  use { run_root .. "cmp-buffer" }   -- cmp buffer
  use { run_root .. "cmp-path" }     -- cmp path
  use { run_root .. "cmp-cmdline" }  -- cmp cmdline
  use { run_root .. "cmp-nvim-lsp" } -- cmp lsp
  use { run_root .. "cmp-nvim-lua" } -- cmp lua
  use {
    run_root .. "cmp-nuget",         -- cmp nuget
    requires = run_root .. "plenary.nvim",
    config = function() require("cmp-nuget").setup {} end,
  }

  -- lsp::
  -- use "neovim/nvim-lspconfig" -- enable LSP
  use { run_root .. "nvim-lspconfig" }       -- BUG: cannot run from localhost
  use { run_root .. "mason.nvim" }           -- lsp installer
  use { run_root .. "mason-lspconfig.nvim" } -- lsp install config
  use { run_root .. "mason-null-ls.nvim" }
  use { run_root .. "lsp-setup.nvim" }
  use { run_root .. "prettier.nvim" }
  -- use { run_root .. "formatter.nvim" }

  use { run_root .. "nlsp-settings.nvim" }          -- json
  use { run_root .. "none-ls.nvim" }                -- formatters and linters
  use { run_root .. "SchemaStore.nvim" }            -- json extended schemas
  use { run_root .. "lsp-overloads.nvim" }          -- csharp lsp overloads
  use { run_root .. "csharpls-extended-lsp.nvim" }  -- csharp_ls extended decompile
  -- use { run_root .. "lsp-omnisharp.nvim" } -- omnisharp    -- BUG: breaks highlighting
  use { run_root .. "omnisharp-extended-lsp.nvim" } -- csharp omnisharp
  use {
    run_root .. "typescript.nvim",                  -- typescript
    config = function() require("typescript").setup {} end,
  }
  use { run_root .. "clangd_extensions.nvim" }

  -- lsp::parameter_hints
  use {
    run_root .. "inlay-hints.nvim",
    config = function()
      require('inlay-hints').setup {
        only_current_line = false,
        eol = {
          right_align = true,
        }
      }
    end,
  }

  -- lsp::signature_hints
  use {
    run_root .. "lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup {
        bind = true,
        handler_opts = {
          border = "rounded"
        }
      }
    end,
  }

  -- lsp_progress
  use { run_root .. "lualine-lsp-progress" }
  use {
    run_root .. "fidget.nvim",
    config = function() require('fidget').setup {} end,
  }

  -- refactor::
  use {
    run_root .. "refactoring.nvim",
    requires = {
      run_root .. "plenary.nvim",
      run_root .. "nvim-treesitter",
    },
    config = function() require("refactoring").setup {} end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

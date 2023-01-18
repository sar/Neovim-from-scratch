--#region Options
require "user.options"
require "user.keymaps"
--#endregion

--#region Plugins
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.dap"
-- BUG: module dap-install not found
--require "user.dap-install"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.feline"
require "user.gitsigns"
require "user.nvim-tree"
require "user.neotree"
require "user.scrollbar"
--require "user.sidebar"
require "user.symbols-outline"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
--#endregion

--#region LSP
require "user.lsp"
--#endregion

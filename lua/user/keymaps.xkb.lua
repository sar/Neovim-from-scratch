local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode        = "n",
--   insert_mode        = "i",
--   visual_mode        = "v",
--   visual_block_mode  = "x",
--   term_mode          = "t",
--   command_mode       = "c",
-- Keys
--   cntrl  = "C"
--   alt    = "A"
--   super  = "M"
--   shift  = "S"
-- Function Keys
--  F1    = F1  = K67
--  F12   = F12 = K78
--  S-F1  = F13 = K191
--  S-F12 = F24 = K
--  C-F1  = F25 = K
--  C-F12 = F36 = K
--  M-F1  = F37 = K
--  M-F12 = F48 = K
--  A-F1  = F49 = K
--  A-F12 = F60 = K

-- Unmapped
keymap("n", "<F50>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F51>", ":echo 'key unmapped' <CR>", opts)

-- Normal --

-- mode.normal
keymap("i", "jk", "<ESC>", opts)

-- navigate.focus
keymap("n", "<F35>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<Char-0x2207>", "<C-w>l", opts)

-- navigate.split
keymap("n", "<ESC><ESC>", ":vertical split<CR>", opts)
keymap("n", "<Char-0x2202>", ":vertical split<CR>", opts)
keymap("n", "<C-]>", ":split<CR>", opts)

-- navigate.resize
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- navigate.buffers
keymap("n", "<Char-0x2264>", ":bprevious<CR>", opts)
keymap("n", "<Char-0x2265>", ":bnext<CR>", opts)
keymap("n", "<F23>", ":BufferClose<CR>", opts)
keymap("n", "<F24>", ":tabnew<CR>", opts)

-- navigate.text
keymap("n", "<F31>", "<S-b>", opts)
keymap("n", "<F32>", "<S-)>", opts)
keymap("n", "<F33>", "<S-(>", opts)
keymap("n", "<F34>", "<S-w>", opts)
--keymap("n", "<>", "jjj", opts)
--keymap("n", "<>", "kkk", opts)

-- Actions

-- actions.telescope
-- keymap("n", "<F54>", ":Telescope lsp_type_definitions <CR>", opts)
keymap("n", "<Char-0x0394>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<F28>", ":Telescope lsp_references <CR>", opts)
keymap("n", "<Char-0x03a1>", ":Telescope find_files <CR>", opts)
-- keymap("n", "<F56>", ":Telescope lsp_dynamic_workspace_symbols <CR>", opts)

-- actions.menu
keymap("n", "<Char-0x039c>", "<cmd>CodeActionMenu <CR>", opts)
keymap("i", "<Char-0x039c>", "<cmd>CodeActionMenu <CR>", opts)

-- actions.replace 
--keymap("n", "<>", "<cmd>lua require('spectre').open() <CR>", opts)
--keymap("n", "<>", "<cmd>lua require('renamer').rename() <CR>", opts)    -- BUG
--keymap("i", "<>", "<cmd>lua require('renamer').rename() <CR>", opts)

-- actions.git
--keymap("n", "<>", "<cmd>Neogit <CR>", opts)
--keymap("n", "<>", "<cmd>DiffviewToggleFiles <CR>", opts)
--keymap("n", "<>", "<cmd>Gitsigns diffthis<CR>", opts)
--keymap("n", "<>", "<cmd>VGit buffer_history_preview<CR>", opts)

-- text.move 
-- keymap("n", "<>", "<esc>:m .+1<CR>", opts)
--keymap("n", "<>", "<Esc>:m .-2<CR>", opts)
--keymap("v", "<>", ":m .+1<CR>==", opts)
--keymap("v", "<>", ":m .-2<CR>==", opts)
--keymap("x", "<>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<>", ":move '<-2<CR>gv-gv", opts)
-- keymap("v", "p", '"_dP', opts)   -- BUG unknown

-- text.format 
keymap("n", "<Char-0x03a3>", "<cmd>lua vim.lsp.buf.formatting() <CR>", opts)

-- Visual --
-- keymap("v", "<", "<gv", opts)   -- BUG
-- keymap("v", ">", ">gv", opts)   -- BUG

-- Terminal --
keymap("n", "<Char-0x221a>", "<cmd>terminal<CR>", opts)
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- diagnostic 
--keymap("n", "<>", "<cmd>lua vim.diagnostic.setloclist() <CR>", opts)

-- debugger
--keymap("n", "<>", "<cmd>lua require'dap'.toggle_breakpoint() <CR>", opts)
--keymap("n", "<>", "<cmd>lua require('dapui').toggle() <CR>", opts)
--keymap("n", "<>", "<cmd>lua require'dap'.continue() <CR>", opts)
--keymap("n", "<>", "<cmd>lua require'dap'.step_over() <CR>", opts)
--keymap("n", "<>", "<cmd>lua.require'dap'.step_into() <CR>", opts)
--keymap("n", "<>", "<cmd>lua.require'dap'.step_out() <CR>", opts)
-- keymap("n", "<>", "<cmd>lua require'dap'.repl.open() <CR>", opts)

-- plugs
-- BUG: unknown (possibly REST HTTP client)
-- keymap("n", "<C-S-A-F7>", "<cmd><Plug>RestNvim <CR>", opts)
-- keymap("n", "<C-S-A-F5>", "<cmd><Plug>RestNvimPreview <CR>", opts)

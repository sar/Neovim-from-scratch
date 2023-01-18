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
keymap("n", "<F37>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F38>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F39>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F40>", ":echo 'key unmapped' <CR>", opts)
--
keymap("n", "<F45>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F46>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F47>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F48>", ":echo 'key unmapped' <CR>", opts)
--
keymap("n", "<F57>", ":echo 'key unmapped' <CR>", opts)
keymap("n", "<F58>", ":echo 'key unmapped' <CR>", opts)


-- Normal --

-- mode.normal
keymap("i", "jk", "<ESC>", opts)

-- navigate.focus
keymap("n", "<F9>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<F12>", "<C-w>l", opts)

-- navigate.split
keymap("n", "<ESC><ESC>", ":vertical split<CR>", opts)
keymap("n", "<C-]>", ":split<CR>", opts)

-- navigate.resize
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- navigate.buffers
keymap("n", "<F10>", ":bprevious<CR>", opts)
keymap("n", "<F11>", ":bnext<CR>", opts)
keymap("n", "<F15>", ":tabnew<CR>", opts)
keymap("n", "<F53>", ":BufferClose<CR>", opts)

-- navigate.text
keymap("n", "<F1>", "<S-b>", opts)
keymap("n", "<F4>", "<S-w>", opts)
keymap("n", "<F2>", "<S-)>", opts)
keymap("n", "<F3>", "<S-(>", opts)
keymap("n", "<F41>", "<S-b>", opts)
keymap("n", "<F42>", "jjj", opts)
keymap("n", "<F43>", "kkk", opts)
keymap("n", "<F44>", "<S-w>", opts)

-- Actions

-- actions.telescope
-- keymap("n", "<F54>", ":Telescope lsp_type_definitions <CR>", opts)
keymap("n", "<F54>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<F55>", ":Telescope lsp_references <CR>", opts)
keymap("n", "<F56>", ":Telescope find_files <CR>", opts)
-- keymap("n", "<F56>", ":Telescope lsp_dynamic_workspace_symbols <CR>", opts)

-- hover
keymap("n", "<F59>", "<cmd>CodeActionMenu <CR>", opts)
keymap("i", "<F59>", "<cmd>CodeActionMenu <CR>", opts)

-- actions.replace 
keymap("n", "<F13>", "<cmd>lua require('spectre').open() <CR>", opts)
keymap("n", "<F14>", "<cmd>lua require('renamer').rename() <CR>", opts)    -- BUG
keymap("i", "<F14>", "<cmd>lua require('renamer').rename() <CR>", opts)

-- actions.git
keymap("n", "<F21>", "<cmd>Neogit <CR>", opts)
keymap("n", "<F22>", "<cmd>DiffviewToggleFiles <CR>", opts)
keymap("n", "<F23>", "<cmd>Gitsigns diffthis<CR>", opts)
keymap("n", "<F24>", "<cmd>VGit buffer_history_preview<CR>", opts)

-- text.move 
keymap("n", "<F26>", "<esc>:m .+1<CR>", opts)
keymap("n", "<F27>", "<Esc>:m .-2<CR>", opts)
keymap("v", "<F26>", ":m .+1<CR>==", opts)
keymap("v", "<F27>", ":m .-2<CR>==", opts)
keymap("x", "<F26>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<F27>", ":move '<-2<CR>gv-gv", opts)
-- keymap("v", "p", '"_dP', opts)   -- BUG unknown

-- text.format 
keymap("n", "<F28>", "<cmd>lua vim.lsp.buf.formatting() <CR>", opts)

-- Visual --
-- keymap("v", "<", "<gv", opts)   -- BUG
-- keymap("v", ">", ">gv", opts)   -- BUG

-- Terminal --
keymap("n", "<F32>", "<cmd>terminal<CR>", opts)
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- diagnostic 
keymap("n", "<F31>", "<cmd>lua vim.diagnostic.setloclist() <CR>", opts)

-- debugger
keymap("n", "<F29>", "<cmd>lua require'dap'.toggle_breakpoint() <CR>", opts)
keymap("n", "<F30>", "<cmd>lua require('dapui').toggle() <CR>", opts)
keymap("n", "<F33>", "<cmd>lua require'dap'.continue() <CR>", opts)
keymap("n", "<F34>", "<cmd>lua require'dap'.step_over() <CR>", opts)
keymap("n", "<F35>", "<cmd>lua.require'dap'.step_into() <CR>", opts)
keymap("n", "<F36>", "<cmd>lua.require'dap'.step_out() <CR>", opts)
-- keymap("n", "<F32>", "<cmd>lua require'dap'.repl.open() <CR>", opts)

-- plugs
-- BUG: unknown (possibly REST HTTP client)
-- keymap("n", "<C-S-A-F7>", "<cmd><Plug>RestNvim <CR>", opts)
-- keymap("n", "<C-S-A-F5>", "<cmd><Plug>RestNvimPreview <CR>", opts)

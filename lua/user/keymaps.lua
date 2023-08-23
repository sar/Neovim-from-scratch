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

-- Normal --
-- mode.normal 
keymap("i", "jk", "<ESC>", opts)

-- navigate.focus
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- navigate.split
keymap("n", "<ESC><ESC>", ":vertical split<CR>", opts)
keymap("n", "<C-]>", ":split<CR>", opts)

-- navigate.resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- navigate.buffers
keymap("n", "<S-j>", ":bnext<CR>", opts)
keymap("n", "<S-k>", ":bprevious<CR>", opts)
keymap("n", "<A-t>", ":tabnew<CR>", opts)
keymap("n", "<A-w>", ":BufferClose<CR>", opts)
keymap("n", "<A-d>", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<A-f>", ":Telescope find_files<CR>", opts)
keymap("n", "<A-r>", ":Telescope lsp_references<CR>", opts)

-- navigate.terminal
keymap("n", "<A-i>", ":lua require('FTerm').toggle()<CR>", opts)
-- keymap("t", "<bs>", "<C-w>", opts) -- BUG: remap does not work
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Actions --

-- code.menu
keymap("n", "<A-z>", ":CodeActionMenu<CR>", opts)
keymap("i", "<A-z>", ":CodeActionMenu<CR>", opts)

-- text.replace 
keymap("n", "<F7>", "<cmd>lua require('spectre').open() <CR>", opts)

-- text.move
keymap("n", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

-- text.indent
keymap("n", "<", "<gv", opts)
keymap("n", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- text.replace
keymap("v", "p", '"_dP', opts)

-- text.format
keymap("n", "<F2>", ":lua vim.lsp.buf.formatting()<CR>", opts)

-- rest (A+F8...F10)
keymap("n", "<F56>", "<Plug>RestNvimPreview<CR>", opts)
keymap("n", "<F57>", "<Plug>RestNvim<CR>", opts)
keymap("n", "<F58>", "<Plug>RestNvimLast<CR>", opts)

-- pgsql (C+F8...F10)
-- see plugins.lua

-- debugger
keymap("n", "<F8>", "<cmd>lua require'dap'.toggle_breakpoint() <CR>", opts)
keymap("n", "<F20>", "<cmd>lua require('dapui').toggle() <CR>", opts)
keymap("n", "<F9>", "<cmd>lua require'dap'.continue() <CR>", opts)
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over() <CR>", opts)
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into() <CR>", opts)
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out() <CR>", opts)
-- keymap("n", "<F32>", "<cmd>lua require'dap'.repl.open() <CR>", opts)

-- diagnostics
keymap("n", "<A-q>", ":lua vim.diagnostic.setloclist()<CR>", opts)


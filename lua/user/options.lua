local options = {
  -- save::
  backup = false,
  writebackup = true,
  swapfile = true,
  undofile = true,
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard

  -- editor::
  conceallevel = 0,
  fileencoding = "utf-8",
  wrap = true,
  linebreak = true,
  updatetime = 75,                         -- faster completion (4000ms default)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  smartcase = true,
  expandtab = true,
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  smartindent = true,

  -- search::
  hlsearch = true,
  ignorecase = true,

  -- interface::
  mouse = "a",
  cmdheight = 2,
  pumheight = 24,
  showmode = true,
  showtabline = 2,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  cursorline = true,
  number = true,
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes", 			   -- always show the sign column, otherwise it would shift the text each time wrap = true, -- display lines as one long line
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use


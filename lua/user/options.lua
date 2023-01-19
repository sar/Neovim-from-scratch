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
  updatetime = 30,                         -- faster completion (4000ms default)
  timeoutlen = 150,                        -- time to wait for a mapped sequence to complete (in milliseconds)
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
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  pumheight = 24,                          -- pop up menu height
  showmode = true,                         -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

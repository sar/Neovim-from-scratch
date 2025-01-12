vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd User TelescopePreviewerLoaded setlocal wrap
  augroup end

  augroup _auto_run
    autocmd!
    autocmd VimEnter * :Alpha
    autocmd VimEnter * :Neotree
    " autocmd VimEnter * :Trouble
    autocmd BufWinEnter * :BufferOrderByBufferNumber
  augroup end

  augroup _outline
    " autocmd BufWinEnter * :SymbolsOutlineOpen
    autocmd FileType Outline setlocal signcolumn=no
  augroup end

  augroup _buffer
    autocmd!
    autocmd CursorHold * :lua vim.lsp.buf.hover()
    autocmd CursorHoldI * :lua vim.lsp.buf.hover()
    autocmd CursorHold * :lua vim.diagnostic.open_float({ scope="line" })
    " " autocmd BufWinEnter * :lua vim.diagnostic.setloclist()
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=2 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end

" ----------------------------------------
" Bindings
" ----------------------------------------

" Note: This line MUST come before any <leader> mappings
let g:mapleader=','

" Window {{{
" Window Movement
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>

" Window Splitting
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
" }}}

" Common typos {{{
command! W w
command! Q q
command! WQ wq
command! Wq wq
" }}}

" Edit vimrc with ,vi
nmap <silent> <leader>vi :e ~/.vim/vimrc<CR>

" Navigating the language client
nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> R :call LanguageClient#textDocument_rename()<CR>

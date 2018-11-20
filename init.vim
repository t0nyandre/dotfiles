if has('persistent_undo')
  if exists('$SUDO_USER')
    " don't create root-owned files
    set noundofile
  else
    set undodir=~/.config/nvim/.undo
    " actually use undo files
    set undofile
  endif
endif

" Backups
set swapfile  " I want to keep swapfiles
set directory=~/.config/nvim/.temp
set backupdir=~/.config/nvim/.temp

" Behaviors
set iskeyword+=$,@
set splitright
set clipboard=unnamedplus
set mousehide
set mouse=""

" UI
set number
set relativenumber
set noshowmode
set numberwidth=4
set laststatus=2
set encoding=utf-8
set lazyredraw
set title

" Text Format
set tabstop=2
set shiftwidth=2
set expandtab

" Searching
set ignorecase
set incsearch
set smartcase
set hlsearch

if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif

" Visual
set noshowmatch

" Sounds
set noerrorbells
set novisualbell

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
  let g:NERDTreeShowBookmarks=1
  let g:NERDTreeChDirMode=2
  let g:NERDTreeHijackNetrw=0
  augroup nerdtree
    autocmd!
    autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
  augroup END
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'dir': expand('~/.fzf'), 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_command_prefix = 'FZF'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
  let g:ale_completion_enabled = 0
  let g:ale_linters = {}
  let g:ale_linters.elixir = ['credo', 'mix']
  let g:ale_fixers = {}
  let g:ale_fixers.elixir = ['mix_format']
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ }

  let g:lightline.component_expand = {
        \  'linter_checking': 'lightline#ale#checking',
        \  'linter_warnings': 'lightline#ale#warnings',
        \  'linter_errors': 'lightline#ale#errors',
        \  'linter_ok': 'lightline#ale#ok',
        \ }

  let g:lightline.component_type = {
        \     'linter_checking': 'left',
        \     'linter_warnings': 'warning',
        \     'linter_errors': 'error',
        \     'linter_ok': 'left',
        \ }

  let g:lightline.active = { 'right': [
        \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
        \ [ 'percent' ],
        \ [ 'fileformat', 'fileencoding', 'filetype' ],
        \ ]}
Plug 'mileszs/ack.vim'
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  endif
  cnoreabbrev Rg Ack
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'terryma/vim-multiple-cursors'
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_start_word_key = '<C-n>'
  let g:multi_cursor_next_key = '<C-n>'
  let g:multi_cursor_prev_key = '<A-n>'
  let g:multi_cursor_skip_key = '<C-x>'
  let g:multi_cursor_quit_key = '<Esc>'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup=1
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  let g:LanguageClient_serverCommands = {}
  let g:LanguageClient_serverCommands.elixir = [ expand('~/.dotfiles/lsp/elixir-ls/rel/language_server.sh') ]
  let g:LanguageClient_serverCommands.php = [ 'php', 'vendor/felixfbecker/language-server/bin/php-language-server.php' ]
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
" Elixir
Plug 'c-brenn/phoenix.vim'
" PHP
Plug 'roxma/LanguageServer-php-neovim', {
      \ 'do': 'composer install && composer run-script parse-stubs'
      \ }
" VimL
Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
Plug 'syngan/vim-vimlint', { 'for' : 'vim' }
call plug#end()

filetype plugin indent on   " Detect file types
set hidden                  " Change buffer without saving
if has('termguicolors')
  set termguicolors
endif
syntax on
color dracula

let g:mapleader=','

" Split management
nmap <silent> <leader>w= :wincmd =<CR>
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" Navigate window splittings
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Exiting terminal mode
tnoremap <Esc> <C-\><C-n>

" Moving lines
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Remove search highlight until next time
nmap <silent> <leader><space> :noh<CR>

" Ale
nnoremap <leader>df :ALEFix<CR>

" Common Typos
command! W w
command! Q q
command! WQ wq
command! Wq wq

" NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap \| :NERDTreeFind<CR>

" Ack
nnoremap <Leader>a :Ack!<Space>

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gblame<CR>
nnoremap <leader>gg :Gbrowse<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gv :Gitv<CR>

" LanguageClient-neovim
nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>rn :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>fr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>fs :call LanguageClient#textDocument_documentSymbol()<CR>

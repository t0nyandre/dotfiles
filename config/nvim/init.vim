" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"| | |  _  |               |_   _|    (_) | | | | (_)          
"| |_| |/' |_ __  _   _ ___  | | _ __  _| |_| | | |_ _ __ ___  
"| __|  /| | '_ \| | | / __| | || '_ \| | __| | | | | '_ ` _ \ 
"| |_\ |_/ / | | | |_| \__ \_| || | | | | |_\ \_/ / | | | | | |
" \__|\___/|_| |_|\__, |___/\___/_| |_|_|\__|\___/|_|_| |_| |_|
" - - - - - - - - -_-/ |- - - - - - - - - - - - - - - - - - - -
"                 |___/     
"
"  Author:  Tony André Haugen
"  Web:     https://tonyandre.co
"  Mail:    post@tonyandre.co
"  Repo:    https://github.com/t0nyandre/dotfiles/
"
"  Plugins ---------------------------------------------------- {{{

"  Setup Vim-Plug {{{
   if empty(glob('~/.config/nvim/autoload/plug.vim'))
     silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif

   call plug#begin('~/.config/nvim/plugged')
     Plug 'chriskempson/base16-vim'
     Plug 'itchyny/lightline.vim'
     Plug 'mileszs/ack.vim'
     Plug 'junegunn/fzf', { 'do': './install --bin' }
     Plug 'junegunn/fzf.vim'
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
       let g:deoplete#enable_at_startup = 1
     Plug 'Shougo/neco-syntax'
     Plug 'Shougo/neco-vim'
     Plug 'Shougo/neoinclude.vim'
     Plug 'zchee/deoplete-zsh'
     Plug 'Shougo/neosnippet.vim'
     Plug 'HerringtonDarkholme/yats.vim'
     Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
     Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run build' }
     Plug 'sbdchd/neoformat'
     Plug 'neomake/neomake'
     Plug 'ervandew/supertab'
"  }}}

   call plug#end()
"  }}}

"  Cosmetics -------------------------------------------------- {{{
     set termguicolors
     colors base16-tomorrow-night
     set noshowmode
     set laststatus=2
     syntax on
"  }}}

"  Behaviors -------------------------------------------------- {{{
"  Set persistent undos if not root user
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

"  Disable use of mouse
     set mouse=""
     set mousehide

"  Open new splits to right and bottom
     set splitbelow
     set splitright

"  nvim - always use system clipboard (via pbcopy)
     set clipboard+=unnamedplus
"  }}}

"  UI --------------------------------------------------------- {{{
"  Make tabs two spaces wide. Use spaces, not tabs
     set tabstop=2
     set shiftwidth=2
     set expandtab
     set smarttab
     set autoindent
     set nosmartindent

"  General views
     set laststatus=2
     set cmdheight=2

"  Better searching. Be case-insensitive unless I use uppercase
     set ignorecase
     set smartcase
     set incsearch
     set hlsearch
     set wrapscan

     if executable('rg')
       set grepprg=rg\ --vimgrep
     elseif executable('ack')
       set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
       set grepformat=%f:%l:%c:%m
     endif

"  Cancel hilight search
     noremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

"  Enable relative line numbers
     set number
     set relativenumber

"  Tell Vim to automatically use absolute line numbers when we’re in insert mode
"  and relative numbers when we’re in normal mode:
     autocmd InsertEnter * :set norelativenumber
     autocmd InsertLeave * :set relativenumber

"  Default encoding is utf-8
     set encoding=utf-8

"  Disable bells
     set belloff=all
     set novisualbell

"  Show filename in the window titlebar
     set title

"  Start scrolling 5 lines before the horizontal window border
     set scrolloff=5
"  }}}

"  System bindings -------------------------------------------- {{{
     let g:mapleader=','

"  Split management
     nmap <silent> <leader>hs :split<CR>
     nmap <silent> <leader>vs :vsplit<CR>
     nmap <silent> <leader>sc :close<CR>

"  Navigate window splittings
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

"  Exiting terminal mode
     tnoremap <Esc> <C-\><C-n>

"  Moving lines
     vnoremap <A-j> :m '>+1<CR>gv=gv
     vnoremap <A-k> :m '<-2<CR>gv=gv

"  Remove search highlight until next time
     nmap <silent> <leader><space> :noh<CR>

"  Common Typos
     command! W w
     command! Q q
     command! WQ wq
     command! Wq wq
"  }}}

"  Plugin specific -------------------------------------------- {{{
"  FZF.vim
     nnoremap <C-p> :Files<cr>
     nnoremap <leader>b :Buffers<cr>

"  Neosnippet
     let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
   " Use C-k to select-and-expand a snippet from deoplete popup
   " use C-n and C-p to select it.
     imap <C-k>     <Plug>(neosnippet_expand_or_jump)
     smap <C-k>     <Plug>(neosnippet_expand_or_jump)
     xmap <C-k>     <Plug>(neosnippet_expand_target)
     let g:neosnippet#disable_runtime_snippets = {
           \ '_': 1,
           \ }

   " For conceal markers.
     if has('conceal')
       set conceallevel=2 concealcursor=niv
     endif

"  Neoformat
     let g:neoformat_basic_format_trim = 1
     let g:neoformat_try_formatprg = 1
     let g:neoformat_only_msg_on_error = 1

"  Supertab
     let g:SuperTabMappingForward = '<s-tab>'                                                                                                                                                                                          
     let g:SuperTabMappingBackward = '<tab>'     

"  Neomake
     call neomake#configure#automake('rw', 1000)
     let g:neomake_warning_sign = {
       \ 'text': 'W',
       \ 'texthl': 'WarningMsg',
       \ }
     let g:neomake_error_sign = {
       \ 'text': 'E',
       \ 'texthl': 'ErrorMsg',
       \ }

"  LanguageClient-neovim
     set hidden
     let g:LanguageClient_serverCommands = {}
     nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
     nnoremap <silent> <leader>gd :call LanguageClient#textDocument_definition()<CR>
     nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"  }}}

"  Language specific ------------------------------------------ {{{
"  TypeScript
     let g:neomake_typescript_enabled_makers = ['tslint']
     let g:neoformat_enabled_python = ['prettier']
     autocmd BufWritePre *.ts,*.tsx Neoformat
     let g:LanguageClient_serverCommands.typescript = ['node', '~/.config/nvim/plugged/javascript-typescript-langserver/lib/language-server-stdio']
"  }}}

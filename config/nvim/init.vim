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
     Plug 'junegunn/fzf', { 'do': './install --bin' }
     Plug 'junegunn/fzf.vim'
     Plug 'ncm2/ncm2'
     Plug 'roxma/nvim-yarp'
     Plug 'ncm2/ncm2-bufword'
     Plug 'ncm2/ncm2-path'
     Plug 'Shougo/neco-syntax'
     Plug 'ncm2/ncm2-syntax'
     Plug 'Shougo/neco-vim'
     Plug 'Shougo/neoinclude.vim'
     Plug 'ncm2/ncm2-neoinclude'
     Plug 'Shougo/neosnippet.vim'
     Plug 'ncm2/ncm2-neosnippet'
     Plug 'kien/rainbow_parentheses.vim'
     Plug 'HerringtonDarkholme/yats.vim'
     Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
     Plug 'Shougo/echodoc.vim'
     Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
     Plug 'w0rp/ale'
     Plug 'tpope/vim-commentary'
     Plug 'ervandew/supertab'
     Plug 'machakann/vim-sandwich'
     Plug 'tpope/vim-repeat'
     Plug 'jparise/vim-graphql'
     Plug 'ekalinin/Dockerfile.vim'
     Plug 'terryma/vim-multiple-cursors'
     Plug 'stephpy/vim-yaml'
     Plug 'elzr/vim-json'
     Plug 'tpope/vim-dotenv'
     Plug 'jiangmiao/auto-pairs'
     Plug 'mhinz/vim-startify'
     Plug 'peitalin/vim-jsx-typescript'

     " Git integration
     Plug 'tpope/vim-fugitive'
     Plug 'tpope/vim-rhubarb'
     Plug 'gregsexton/gitv', {'on': ['Gitv']}
     Plug 'airblade/vim-gitgutter'
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
"    Set persistent undos if not root user
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

"    Disable use of mouse
     set mouse=""
     set mousehide

"    Open new splits to right and bottom
     set splitbelow
     set splitright

"    nvim - always use system clipboard (via pbcopy)
     set clipboard+=unnamedplus
"  }}}

"  UI --------------------------------------------------------- {{{
"    Make tabs two spaces wide. Use spaces, not tabs
     set tabstop=2
     set shiftwidth=2
     set expandtab
     set smarttab
     set autoindent
     set nosmartindent

"    General views
     set laststatus=2
     set cmdheight=1

"    Better searching. Be case-insensitive unless I use uppercase
     set ignorecase
     set smartcase
     set incsearch
     set hlsearch
     set wrapscan

     if executable('rg')
       set grepprg=rg\ --vimgrep
     endif

"    Cancel highlight search
     noremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

"    Enable relative line numbers
     set number

"    Default encoding is utf-8
     set encoding=utf-8

"    Disable bells
     set belloff=all
     set novisualbell

"    Show filename in the window titlebar
     set title

"    Start scrolling 5 lines before the horizontal window border
     set scrolloff=5
"  }}}

"  System bindings -------------------------------------------- {{{
     let g:mapleader=','

"    Split management
     nmap <silent> <leader>hs :split<CR>
     nmap <silent> <leader>vs :vsplit<CR>
     nmap <silent> <leader>sc :close<CR>

"    Navigate window splittings
     :tnoremap <C-h> <C-\><C-N><C-w>h
     :tnoremap <C-j> <C-\><C-N><C-w>j
     :tnoremap <C-k> <C-\><C-N><C-w>k
     :tnoremap <C-l> <C-\><C-N><C-w>l
     :inoremap <C-h> <C-\><C-N><C-w>h
     :inoremap <C-j> <C-\><C-N><C-w>j
     :inoremap <C-k> <C-\><C-N><C-w>k
     :inoremap <C-l> <C-\><C-N><C-w>l
     :nnoremap <C-h> <C-w>h
     :nnoremap <C-j> <C-w>j
     :nnoremap <C-k> <C-w>k
     :nnoremap <C-l> <C-w>l

"    Escape with qq
     inoremap qq <Esc>
     vnoremap qq <Esc>
     nnoremap qq <Esc>
     " Escape terminal with qq
     tnoremap qq <C-\><C-n>

"    Disable arrow keys
     noremap <Up> <NOP>
     noremap <Down> <NOP>
     noremap <Left> <NOP>
     noremap <Right> <NOP>
     
"    Moving lines
     vnoremap <A-j> :m '>+1<CR>gv=gv
     vnoremap <A-k> :m '<-2<CR>gv=gv

"    Quickly save file
     nmap <silent> <leader>w :w<CR>

"    Remove search highlight until next time
     nmap <silent> <leader><space> :noh<CR>

"    Common Typos
     command! W w
     command! Q q
     command! WQ wq
     command! Wq wq
"  }}}

"  Plugin specific -------------------------------------------- {{{
"    FZF.vim
     nnoremap <C-p> :Files<cr>
     nnoremap <leader>b :Buffers<cr>

"    Neosnippet
     let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
     " Press enter key to trigger snippet expansion
     inoremap <silent> <expr> <CR> ncm2_neosnippet#expand_or("\<CR>", 'n')
     let g:neosnippet#disable_runtime_snippets = {
           \ '_': 1,
           \ }

     " For conceal markers.
     if has('conceal')
       set conceallevel=2 concealcursor=niv
     endif
     
"    ncm2
     autocmd BufEnter * call ncm2#enable_for_buffer()
     set completeopt=noinsert,menuone,noselect
     " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
     " found' messages
     set shortmess+=c
     " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
     inoremap <c-c> <ESC>
     " When the <Enter> key is pressed while the popup menu is visible close 
     " the menu and also start a new line.
     inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

"    Gitgutter
     if exists('&signcolumn')
       set signcolumn=yes
     else
       let g:gitgutter_sign_column_always = 1
     endif

"    Supertab
     let g:SuperTabMappingForward = '<s-tab>'                                                                                                                                                                                          
     let g:SuperTabMappingBackward = '<tab>'     

"    A.L.E.
     let g:ale_fixers = {
         \   '*': ['remove_trailing_lines', 'trim_whitespace'],
         \   'typescript': ['prettier'],
         \   'typescript.tsx': ['prettier'],
         \ }

     let g:ale_linters = {
         \   'typescript': ['tslint', 'tsserver'],
         \   'typescript.tsx': ['tslint', 'tsserver'],
         \ }

     let g:ale_linters_explicit = 1
     let g:ale_sign_error = '!!'
     let g:ale_sign_warning = '?'

     let g:ale_echo_msg_error_str = '!!'
     let g:ale_echo_msg_warning_str = '?'
     let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

     let g:ale_list_window_size = 5

     nmap <silent> <C-k> <Plug>(ale_previous_wrap)
     nmap <silent> <C-j> <Plug>(ale_next_wrap)

     nmap <silent> <leader>af :ALEFix<CR>

"    LanguageClient-neovim
     set hidden
     " let g:LanguageClient_serverCommands = {}
     " nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
     " nnoremap <silent> <leader>gd :call LanguageClient#textDocument_definition()<CR>
     " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"    Auto-pairs
     let g:AutoPairsFlyMode = 0
     let g:AutoPairsShortcutBackInsert = '<M-b>'

"    Rainbow parantheses
     au VimEnter * RainbowParenthesesToggle
     au Syntax * RainbowParenthesesLoadRound
     au Syntax * RainbowParenthesesLoadSquare
     au Syntax * RainbowParenthesesLoadBraces     
"  }}}

"  Language specific ------------------------------------------ {{{
"    TypeScript
     " set filetypes as typescript.tsx
     autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
     autocmd BufWritePre *.ts,*.tsx,*.jsx ALEFix
     " let g:LanguageClient_serverCommands.typescript = ['node', '~/.config/nvim/plugged/javascript-typescript-langserver/lib/language-server-stdio']
     " let g:LanguageClient_serverCommands["typescript.tsx"] = ['node', '~/.config/nvim/plugged/javascript-typescript-langserver/lib/language-server-stdio']


"    JSON
     autocmd BufNewFile,BufRead .prettierrc set syntax=json
     let g:vim_json_syntax_conceal = 0
"  }}}

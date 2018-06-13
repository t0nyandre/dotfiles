if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/t0nyandre/.config/nvim/bundles//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/t0nyandre/.config/nvim/bundles/')
  call dein#begin('/home/t0nyandre/.config/nvim/bundles/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/t0nyandre/.config/nvim/bundles//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('joshdick/onedark.vim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('junegunn/fzf')
  call dein#add('autozimu/LanguageClient-neovim', { 'build': 'bash install.sh' })
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('mattn/emmet-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('sbdchd/neoformat')
  call dein#add('manasthakur/vim-commentor')
  call dein#add('vimlab/split-term.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" ############ General Configuration ############ {{{

let g:mapleader = ','       " Change leader to comma

set termguicolors					  " Setting true colors in NeoVim
set number						      " Enable line numbers.
set relativenumber				  " Shows the line number relative to current line.
set cursorline						  " Highlight current line.
set smartcase						    " Smart case search if there is uppercase
set ignorecase						  " Case insensitive search.
set showmatch						    " Highlight matching brackets.
set nostartofline					  " Jump to first nonblank character.
set fileencoding=utf-8		  " Set UTF-8 encoding of write.
set wrap						        " Enable word wrapping.
set linebreak						    " Wrap lines at convenient points.
set splitright              " Set up new vertical splits positions
set splitbelow              " Set up new horizontal splits positions
set background=dark				  " Setting background to dark or light.
set grepprg=rg\ --vimgrep   " Use ripgrep for grepping
set hidden						      " Hide buffers in background.

" }}}
" ############ Theme Configuration ############# {{{

colorscheme onedark

" }}}
" ############ Turn off swap files ############ {{{

set noswapfile
set nobackup
set nowritebackup

" }}}
" ############ Require interpreter setup ############ {{{

let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 1              " Disable python2 support.

" }}}
" ############ Indentation ############ {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set breakindent
set smartindent
set nofoldenable
set foldmethod=syntax
set foldlevelstart=5

" }}}
" ############ Auto commands ############ {{{

augroup php
  autocmd!
  autocmd FileType php setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd FileType php EmmetInstall
augroup END

" }}}
" ############ Custom mappings ############ {{{

nnoremap <C-p> :FuzzyOpen<CR>

" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc

" Open term
nnoremap <Leader>t :15Term<CR>
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>v <C-w>v

" Clear search highlight.
nnoremap <silent><Leader><space> :noh<CR>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" }}}
" ############ Plugins Setup ############ {{{

" -- Deoplete
let g:deoplete#enable_at_startup = 1        " Enable Deoplete at startup
let g:deoplete#camel_case = 1               " Autocomplete files relative to current buffer path
let g:deoplete#file#enable_buffer_path = 1  " Show only 30 entries in list and allow smart case autocomplete

" -- LanguageClient-neovim
let g:LanguageClient_serverCommands = {
      \ 'php': ['php vendor/felixfbecker/language-server/bin/php-language-server.php'],
      \}

" -- Split-term
let g:disable_key_mappings = 1

" -- emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" -- vim-airline
let g:airline_powerline_fonts = 1

" }}}

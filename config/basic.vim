" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Config {{{
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/.undo
endif

" Prevent netrw buffers from being set as alternate
let g:netrw_altfile = 1
" }}}

" Backups {{{
set swapfile                    " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
" }}}

" Behaviors {{{
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
set wildmode=list:longest " use emacs-style tab completion when selecting files, etc
set hidden             " Change buffer - without saving
set autowriteall       " Writes on make/shell commands
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
set splitright
" }}}

" UI {{{
set number         " Line numbers on
set relativenumber " relative numbers
set nowrap         " Line wrapping off
set cmdheight=1    " Make the command area two lines high
set noshowmode     " don't need to show mode since we have airline
set numberwidth=4
set laststatus=2
set encoding=utf-8
set lazyredraw
" }}}

" Text Format {{{
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set expandtab
" }}}

" Searching {{{
set ignorecase
set smartcase  " Non-case sensitive search
set hlsearch

if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
" }}}

" Visual {{{
set noshowmatch " Disable jumping to matching bracket when typing
" }}}

" Sounds {{{
set noerrorbells
set novisualbell
" }}}

" Mouse {{{
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
" }}}

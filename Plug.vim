if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Navigation {{{
" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" combine with netrw to create a delicious salad dressing
Plug 'tpope/vim-vinegar'

" project configuration via 'projections'
Plug 'tpope/vim-projectionist'

" A command-line fuzzy finder written in Go
let g:fzf_command_prefix = 'FZF'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Active fork of kien/ctrlp.vim. Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'
" }}}

" UI Additions {{{
" Colors {{{
Plug 'dracula/vim', { 'as': 'dracula' }
" }}}
" light and awesome statusline
Plug 'itchyny/lightline.vim'
" }}}

" Vim plugin for the Perl module / CLI script 'ack'
Plug 'mileszs/ack.vim'

" a Git wrapper so awesome, it should be illegal; :Gblame, etc
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" NCM2 completion manager. 
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax'
Plug 'ncm2/ncm2-neoinclude'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ } " Client for the Language server

" Developer icons for statusbar and nerdtree
Plug 'ryanoasis/vim-devicons'

" Language specific {{{
" Crystal {{{
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
" }}}
" PHP {{{
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" }}}
" VimL {{{
Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
Plug 'syngan/vim-vimlint', { 'for': 'vim' }
" }}}
" }}}
call plug#end()

" =======================================
" Based on/forked from: Luan Santos (@luan)
" [http://github.com/t0nyandre/dotfiles]
" Maintained By: Tony Andre Haugen (GitHub: @t0nyandre)
" =======================================

runtime! Plug.vim

runtime! config/basic.vim
runtime! config/bindings.vim
runtime! config/colors.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/lightbar.vim
runtime! config/plugin/langclient.vim 
runtime! config/plugin/ack.vim
runtime! config/plugin/nerdtree.vim
runtime! config/plugin/fugitive.vim

if has('gui_running')
  runtime! config/plugin/ctrlp.vim
else
  runtime! config/plugin/fzf.vim
end

" ----------------------------------------
" Language Configuration
" ----------------------------------------

runtime! config/lang/crystal.vim

#!/usr/bin/env bash
setup_fish() {
	echo "Setting up fish" \
		&& rm -rf ~/.config/fish/config.fish ~/.config/fish/functions \
		&& ln -s $(pwd)/config.fish ~/.config/fish/config.fish \
		&& ln -s $(pwd)/functions ~/.config/fish/functions \
		&& curl -L https://get.oh-my.fish | fish & \
    omf install clearance &
}

install_fonts() {
	echo "Setting up fonts" \
    && mkdir ~/.local/share/fonts \
		&& rm -rf ~/.local/share/fonts/FuraMono-* \
		&& cp $(pwd)/fonts/* ~/.local/share/fonts/
}

setup_termite() {
	echo "Setting up terminal" \
		&& rm -rf ~/.config/termite \
		&& ln -s $(pwd)/termite ~/.config/termite
}

install_fzf() {
	echo "Installing fzf" \
		&& rm -rf ~/.fzf \
		&& git clone https://github.com/junegunn/fzf ~/.fzf \
		&& ~/.fzf/install --all
}

setup_neovim() {
	echo "Setting up NeoVim" \
		&& rm -rf ~/.config/nvim \
		&& curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh \
		&& chmod +x dein_installer.sh \
		&& ./dein_installer.sh ~/.config/nvim/bundles \
		&& ln -s $(pwd)/autoload ~/.config/nvim/autoload \
		&& ln -s $(pwd)/init.vim ~/.config/nvim/init.vim \
		&& nvim -c 'call dein#install()'
}

setup_lsp() {
	echo "Setting up LSP servers" \	
		echo "Setting up PHP-Language-Server" \
		&& composer require jetbrains/phpstorm-stubs:dev-master \
		&& composer require felixfbecker/language-server \
		&& composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
}

echo -n "This will delete all your previous NeoVim, termite and fish configurations. Proceed? (y/n) "
read answer
if echo "$answer" | grep -iq "^y" ;then
	echo "Installing dependencies ..." \
		&& sudo pacman -Sy neovim xclip python2-neovim python-neovim ripgrep fzf composer \
		&& setup_fish \
		&& install_fonts \
		&& setup_termite \
		&& install_fzf \
		&& setup_neovim \
		&& setup_lsp \
		&& echo "Finished installing ..."
fi

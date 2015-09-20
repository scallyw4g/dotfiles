# Setup Zsh
sudo pacman --noconfirm -S zsh zsh-completions
chsh $(which zsh)

# Install package dependencies
sudo pacman --noconfirm -S firefox mpd conky

# Install rbenv and ruby-build
if [ ! -d $HOME/.rbenv ]; then
	echo "Installing rbenv and ruby-build"
	git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
	mkdir $HOME/.rbenv/plugins && git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# Install Vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Installing Vundle"
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

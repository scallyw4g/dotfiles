[ $# -eq 0 ] && echo "Please supply a distribution. Exiting." && exit 1

if [ "$1" == "ubuntu" ]; then
  echo "Installing for ubuntu"
  INSTALL="sudo apt install"

elif [ "$1" == "arch" ]; then
  echo "Installing for arch-linux"
  INSTALL="sudo pacman --noconfirm -S"
else
  echo "Unsupported distro $1"
  exit 1
fi

# Setup Zsh
$INSTALL zsh
# chsh -s $(which zsh)

# Install package dependencies
$INSTALL firefox mpd sxhkd bspwm ack vim git rxvt-unicode

git config --global user.name "Jesse"
git config --global user.email "jesse.hughes.it@gmail.com"

# Install rbenv and ruby-build
# if [ ! -d $HOME/.rbenv ]; then
# 	echo "Installing rbenv and ruby-build"
# 	git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
# 	mkdir $HOME/.rbenv/plugins && git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
# fi

# Install Vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Installing Vundle"
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ ! -d $HOME/dotfiles ]; then
	echo "Installing dotfiles"
  git clone https://github.com/jjbandit/dotfiles.git
fi

[ $# -eq 0 ] && echo "Please supply a distribution. Exiting." && exit 1

DISTRO=$1

if [ "$DISTRO" = "ubuntu" ]; then
  echo "Installing for ubuntu"
  INSTALL="sudo apt install"
  # ack="ack-grep"

elif [ "$DISTRO" = "arch" ]; then
  echo "Installing for arch-linux"
  INSTALL="sudo pacman --noconfirm -S"
  ack="ack"

else
  echo "Unsupported distro $1"
  exit 1
fi

echo "--------------------------------------------------------------------------------"

# Setup Zsh
$INSTALL zsh
# chsh -s $(which zsh)

# Install package dependencies
$INSTALL firefox mpd sxhkd bspwm $ack vim git rxvt-unicode-256color ssh

git config --global user.name "Jesse"
git config --global user.email "jesse.hughes.it@gmail.com"

# install powerline fonts
if [ ! -d $HOME/.local/share/fonts ]; then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd -
  rm -Rf fonts
fi

# TODO(Jesse): Install lemonbar


# Install Composer
if [ ! -f /usr/local/bin/composer ]; then
  echo "Installing Composer"
  sudo curl -s https://getcomposer.org/installer | php
  sudo mv ./composer.phar /usr/local/bin/composer
fi

# Install rbenv and ruby-build
if [ ! -d $HOME/.rbenv ]; then
  echo "Installing rbenv and ruby-build"
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src && cd -

  mkdir $HOME/.rbenv/plugins &&
    git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# Install Vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Installing Vundle"
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ ! -d $HOME/dotfiles ]; then
	echo "Installing dotfiles"
  git clone https://github.com/jjbandit/dotfiles.git
fi



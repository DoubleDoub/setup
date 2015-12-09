#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install -y git
sudo apt-get install -y curl

# Install nvm: node-version manager
# https://github.com/creationix/nvm
wget https://raw.github.com/creationix/nvm/master/install.sh
# I dont know why I have to do this but it works so...
mv install.sh install2.sh
chmod 777 install2.sh
sudo ./install2.sh
rm -f ./install2.sh

# Load nvm and install node
source $HOME/.nvm/nvm.sh
# when you change this also change it in the dotfiles repo which will be cloned later in this script
nvm install v4.2.3
nvm use v4.2.3

# Update npm to latest version
curl -L https://npmjs.com/install.sh | sh

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

#install grunt command line interface
npm install -g grunt-cli

#install bower
npm install -g bower

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

#Install the python-software-properties package to enable installing PPAs
sudo apt-get install python-software-properties

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

#config git
git config --global color.ui true

# Uncomment to Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
#wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#install skype
wget http://www.skype.com/go/getskype-linux-beta-ubuntu-64
#need this for the skype status bar icons
sudo apt-get install sni-qt sni-qt:i386
sudo dpkg -i getskype-*
sudo apt-get -f install
rm -f getskype-linux-beta-ubuntu-64

sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm -f google-chrome-stable_current_amd64.deb


# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/DoubleDoub/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .


# https://www.udacity.com/course/viewer#!/c-ud775-nd/l-2980038599/m-3333158951
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#Just add it to the bash_profile instead of replacing
cat ./setup/bash_profile_course >> ./dotfiles/.bashrc

#install sublime text 3
#http://www.webupd8.org/2013/07/sublime-text-3-ubuntu-ppa-now-available.html
echo | sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

#install gimp
sudo apt-get install -y gimp




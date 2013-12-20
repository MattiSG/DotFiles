# Install homebrew
which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew update

brew doctor || exit 1

# Install all usual packages

brew install bash
brew install git
brew install imagemagick
brew install chromedriver
brew install jsdoc-toolkit
brew install selenium-server-standalone
brew install node
brew install rbenv
brew install ruby-build

# Install brew-cask

brew tap phinze/homebrew-cask
brew install brew-cask || brew upgrade brew-cask

# Install apps

brew cask install google-chrome
brew cask install firefox
brew cask install firefox-aurora
brew cask install opera
brew cask install caffeine
brew cask install carbon-copy-cloner
brew cask install cyberduck
brew cask install daisy-disk
brew cask install dropbox
brew cask install fluid
brew cask install gitx-l
brew cask install growlnotify
brew cask install handbrake
brew cask install imageoptim
brew cask install libreoffice
brew cask install macpardeluxe
brew cask install omni-graffle-pro
brew cask install pacifist
brew cask install postgres
brew cask install sauce
brew cask install sitesucker
brew cask install skype
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install x-quartz
brew cask install xscope

# Prepare brew for multi-users setup

echo "Now let's make brew useful for all users."
echo "Create a 'brew' group through System Preferences: <http://blog.strug.de/2012/06/my-homebrew-multi-user-setup/>"
read -p "Press any key when the 'brew' group has been created"

echo -n "Change the group of homebrew installation directory…"
sudo chgrp -R brew /usr/local
sudo chgrp -R brew /opt/homebrew-cask/
echo "done"

echo -n "Allow group members to write inside this directory…"
sudo chmod -R g+w /usr/local
sudo chmod -R g+w /opt/homebrew-cask/
echo "done"

echo -n "Change the group of homebrew cache directory…"
sudo chgrp -R brew /Library/Caches/Homebrew
echo "done"

echo -n "Allow group members to write inside this directory…"
sudo chmod -R g+w /Library/Caches/Homebrew
echo "done"

# Install tools in other languages

npm install -g growl
npm install -g watai
rbenv install 2.0.0-p247

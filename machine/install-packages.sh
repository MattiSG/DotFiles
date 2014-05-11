# Install homebrew
which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" || echo "**brew not installed**"

brew update

brew doctor || exit 1

# Install latest binaries

brew install bash
brew install git

# Install runtimes

brew install node
brew install go

# Install helper tools

brew install chromedriver
brew install imagemagick
brew install jsdoc-toolkit
brew install rbenv
brew install ruby-build
brew install selenium-server-standalone

# Install brew-cask

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Perhaps are we not running this for the first time?

brew upgrade

# Install browsers

brew cask install google-chrome
brew cask install firefox
brew cask install firefox-aurora
brew cask install opera

# Install apps

brew cask install apptrap
brew cask install airfoil
brew cask install caffeine
brew cask install carbon-copy-cloner
brew cask install cyberduck
brew cask install daisydisk
brew cask install dropbox
brew cask install fluid
brew cask install gitx-rowanj
brew cask install google-refine
brew cask install growlnotify
brew cask install handbrake
brew cask install imageoptim
brew cask install inkscape
brew cask install libreoffice
brew cask install macpardeluxe
brew cask install netshade
brew cask install omnigraffle
brew cask install pacifist
brew cask install perian
brew cask install postgres
brew cask install quicktime-player7
brew cask install sauce
brew cask install sevenzx
brew cask install sitesucker
brew cask install skype
brew cask install shiftit
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install transmission
brew cask install vagrant && vagrant plugin install vagrant-vbguest
brew cask install virtualbox
brew cask install vlc
brew cask install xquartz
brew cask install xscope
brew cask install xslimmer

# Install quicklook plugins
# Credit: https://github.com/sindresorhus/quick-look-plugins

sudo brew cask install --qlplugindir='/Library/QuickLook' betterzipql
sudo brew cask install --qlplugindir='/Library/QuickLook' ipaql
sudo brew cask install --qlplugindir='/Library/QuickLook' qlcolorcode
sudo brew cask install --qlplugindir='/Library/QuickLook' qlmarkdown
sudo brew cask install --qlplugindir='/Library/QuickLook' qlprettypatch
sudo brew cask install --qlplugindir='/Library/QuickLook' qlstephen
sudo brew cask install --qlplugindir='/Library/QuickLook' quicklook-csv
sudo brew cask install --qlplugindir='/Library/QuickLook' quicklook-json
sudo brew cask install --qlplugindir='/Library/QuickLook' suspicious-package
sudo brew cask install --qlplugindir='/Library/QuickLook' webp-quicklook

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
go get github.com/pengwynn/flint

# Save disk space

brew prune
brew cask cleanup

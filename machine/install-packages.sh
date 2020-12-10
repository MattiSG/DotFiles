#!/bin/bash

# Install homebrew
which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "**brew not installed**"

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
brew install ffmpeg --with-webp --with-libvpx
brew install flint-checker
brew install imagemagick
brew install rbenv
brew install ruby-build
brew install selenium-server-standalone
brew install youtube-dl

# Install ad- and track-block

brew install mattisg/mattisg/adblock
sudo adblock on

# Perhaps are we not running this for the first time?

brew upgrade

# Install browsers

brew install --cask google-chrome
brew install --cask firefox
brew install --cask opera

# Install apps

brew install --cask a-better-finder-rename
brew install --cask caffeine
brew install --cask cuteclips
brew install --cask cyberduck
brew install --cask daisydisk
brew install --cask fluid
brew install --cask gitup
brew install --cask gpg-suite
brew install --cask handbrake
brew install --cask imageoptim
brew install --cask inkscape
brew install --cask keybase
brew install --cask libreoffice
brew install --cask licecap
brew install --cask little-snitch
brew install --cask macpar-deluxe
brew install --cask micro-snitch
brew install --cask netshade
brew install --cask noun-project
brew install --cask omnigraffle
brew install --cask pacifist
brew install --cask paparazzi
brew install --cask postgres
brew install --cask sevenzx
brew install --cask sitesucker
brew install --cask skype
brew install --cask spotify
brew install --cask sublime-text
brew install --cask the-unarchiver
brew install --cask transmission
brew install --cask virtualbox
brew install --cask vagrant && vagrant plugin install vagrant-vbguest
brew install --cask vlc
brew install --cask xscope

# Install quicklook plugins
# Credit: https://github.com/sindresorhus/quick-look-plugins

brew install --cask --qlplugindir='/Library/QuickLook' qlcolorcode
brew install --cask --qlplugindir='/Library/QuickLook' qlmarkdown
brew install --cask --qlplugindir='/Library/QuickLook' qlprettypatch
brew install --cask --qlplugindir='/Library/QuickLook' quicklook-csv
brew install --cask --qlplugindir='/Library/QuickLook' quicklook-json
brew install --cask --qlplugindir='/Library/QuickLook' suspicious-package
brew install --cask --qlplugindir='/Library/QuickLook' webpquicklook

# Prepare brew for multi-users setup

echo "Now let's make brew useful for all users."
echo "Create a 'brew' group through System Preferences: <http://blog.strug.de/2012/06/my-homebrew-multi-user-setup/>"
read -p "Press any key when the 'brew' group has been created"

echo -n "Change the group of homebrew installation directory…"
sudo chgrp -R brew /opt/homebrew
echo "done"

echo -n "Allow group members to write inside this directory…"
sudo chmod -R g+w /opt/homebrew
echo "done"

# Save disk space

brew cleanup

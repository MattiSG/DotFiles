# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

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
brew cask install libre-office
brew cask install macpardeluxe
brew cask install omni-graffle-pro
brew cask install pacifist
brew cask install postgres
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

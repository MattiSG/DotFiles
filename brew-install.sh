# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew update

brew doctor || exit 1

# Install all usual packages

brew install bash
brew install git
brew install gibo
brew install image-magick
brew install chromedriver
brew install jsdoc-toolkit
brew install selenium-server-standalone

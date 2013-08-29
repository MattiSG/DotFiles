# Install all usual packages

if ! brew doctor
then exit 1
fi

brew install bash
brew install git
brew install gibo
brew install image-magick
brew install chromedriver
brew install jsdoc-toolkit
brew install selenium-server-standalone

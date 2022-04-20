# Brew
export PATH=/opt/homebrew/bin/:$PATH

# NPM
export PATH=/usr/local/share/npm/bin:$PATH

# Ensure globally-installed modules can be required without npm link
# Source: http://www.davidarno.org/2012/02/09/writing-a-node.js-module-in-coffeescript/
export NODE_PATH=/usr/local/lib/node_modules/

# Go
export GOPATH=/usr/local/Cellar/share/go/bin
export PATH=$PATH:$GOPATH/bin

# DevTools
export PATH=$PATH:/Developer/Tools

# Java
export CLASSPATH=.:${CLASSPATH}

# Ruby with Brew
export PATH=$PATH:/opt/homebrew/lib/ruby/gems/2.7.0/bin/
# Fix libffi issue with macOS (needed for Jekyll)
# Source: https://medium.com/@mythreyi/the-agony-of-setting-up-jekyll-on-macos-catalina-aedd0a536ae
export PKG_CONFIG_PATH=/opt/homebrew/opt/libffi/lib/pkgconfig

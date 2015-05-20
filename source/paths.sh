# Homebrew
export PATH=/usr/local/sbin:$PATH

# Node
export PATH=/usr/local/bin:$PATH

# NPM
export PATH=$PATH:/usr/local/share/npm/bin

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
export PATH=$PATH:/usr/local/opt/ruby/bin

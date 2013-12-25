# Homebrew
export PATH=/usr/local/sbin:$PATH

# Node
export PATH=/usr/local/bin:$PATH

# NPM
export PATH=/usr/local/share/npm/bin:$PATH

# Ensure globally-installed modules can be required without npm link
# Source: http://www.davidarno.org/2012/02/09/writing-a-node.js-module-in-coffeescript/
export NODE_PATH=/usr/local/lib/node_modules/

# DevTools
export PATH=/Developer/Tools:$PATH

# Java
export CLASSPATH=.:${CLASSPATH}

# Ruby with Brew
export PATH=/usr/local/opt/ruby/bin:$PATH

# Edit this dotfiles repository
alias dots="cd $(dirname $BASH_SOURCE)/.. && edit && git pull"
# Reload profile
alias reload="source ~/.profile"
# List with details and colors
alias l="ls -lG"
# List all files (including invisibles) with details and colors
alias la="ls -lGa"
# List only directories
alias ld='ls -lG | grep "^d"'
# Make executable
alias mkex="chmod u+x"
# Get Git root
alias groot='echo ./$(git rev-parse --show-cdup) || pwd'
# Go to Git root
alias gd='[ ! -z `git rev-parse --show-cdup` ] && cd `groot`'
# Colorize grep output
alias grep="grep --color=auto"
# sha any input
alias sha="openssl sha1"
# Re-execute last command as admin; credit: github.com/kud/my.
alias fuck='echo ➥ sudo $(fc -ln -1); sudo $(fc -ln -1)'
# OSX: open current directory with GitX
alias gitx='open -a GitX `groot`'
# OSX: hide file in Finder
alias hide="SetFile -a V"
# OSX: show file in Finder
alias show="SetFile -a v"
# OSX: find with Spotlight
alias spotlight="mdfind -onlyin ."
# OSX: Quicklook file
alias ql="qlmanage -p 2>/dev/null"
# OSX: cd to frontmost Finder window
alias finder='cd "$(osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)")"'

# Git shortcuts
alias push="git push --follow-tags"

#######################
# From Mathias Bynens #
#######################

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Allow alias sudoing
alias sudo="sudo "

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

# Initializes a new Git repository
# $1 (optional) = path to repository to init. Defaults to the current directory.
ginit() {
	if ! [[ -f $1 ]]
	then mkdir $1
	fi
	
	if [[ $1 ]]
	then cd $1
	fi
	
	if [[ -d .git ]]
	then
		echo 'Git repo already present!'
		open . -a GitX
		return 1
	fi
	
	git init
	echo '.DS_Store
*.xcodeproj
build
bin
jars
dist
*.pages
*.exe
*~
*.bak
' >> .gitignore
	git add .
	git commit -m 'Initial import.'
	open . -a GitX
}

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi='vim'
alias createZip="make clean && zip -r $(pwd|grep -o '[^/]*$').zip . --exclude *.tex --exclude *.png --exclude *.aux --exclude *.log --exclude *.toc --exclude *.exe --exclude *.zip --exclude *.fls --exclude *.fdb_latexmk --exclude *.gz --exclude *.o"

alias config='/usr/bin/git --git-dir=/home/thomas/.cfg/ --work-tree=/home/thomas'
alias ls='ls --color=auto --group-directories-first -v '

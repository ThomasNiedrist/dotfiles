alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias ls='ls -lah --color=auto'
alias gotop='gotop-cjbassi'
alias createZip="make clean && zip -r $(pwd|grep -o '[^/]*$').zip . --exclude *.tex --exclude *.png --exclude *.aux --exclude *.log --exclude *.toc --exclude *.exe --exclude *.zip --exclude *.fls --exclude *.fdb_latexmk --exclude *.gz --exclude *.o"

alias config='/usr/bin/git --git-dir=/home/thomas/.cfg/ --work-tree=/home/thomas'

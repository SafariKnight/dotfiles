alias v="fd -H --type f --print0 --exclude .git | fzf-tmux -p -w 85  --read0 --print0 --preview \"bat --color=always --style=numbers {}\" | xargs -r -0 nvim"
alias fvim="fd -H --type f --print0 --exclude .git | fzf-tmux -p -w 85  --read0 --print0 --preview \"bat --color=always --style=numbers {}\" | xargs -r -0 vim"
alias cd=z
alias cls=clear
alias pman="sudo pacman"
alias clipboard="win32yank -i --crlf"
alias shutdown="wsl.exe --shutdown"
alias gradlew="./gradlew"
alias f=fg

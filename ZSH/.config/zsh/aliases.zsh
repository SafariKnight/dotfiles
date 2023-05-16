alias v="fd -H --type f --print0 --exclude .git | sk --read0 --print0 --preview \"bat --color=always --style=numbers {}\" | xargs -r -0 nvim"
alias cd=z
alias cls=clear
alias pman="sudo pacman"
alias ls="exa --icons -a"
alias clipboard="win32yank -i --crlf"

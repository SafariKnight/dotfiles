alias vim="nvim"
alias cls="clear"
alias v="fd -H --type f --print0 --exclude .git | fzf-tmux -p -w 85  --read0 --print0 --preview \"bat --color=always --style=numbers {}\" | xargs -r -0 nvim"
alias shutdown="wsl.exe --shutdown"
alias clipin="win32yank.exe -i --crlf"
alias clipout="win32yank.exe -o --lf"
alias p='pwsh.exe -c'
alias scoop='scoop.exe'
alias ls='exa --group-directories-first'

alias ovim='NVIM_APPNAME=ovim nvim'

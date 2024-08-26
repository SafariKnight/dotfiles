alias vim="nvim"
alias v="fd -H --type f --print0 --exclude .git | fzf-tmux -p -w 85  --read0 --print0 --preview \"bat --color=always --style=numbers {}\" | xargs -r -0 nvim"
alias ls='eza --group-directories-first'
alias ovim='NVIM_APPNAME=ovim nvim'
alias gdvim='nvim --listen 127.0.0.1:55432'
alias rt='trash-put'
alias cat='bat'

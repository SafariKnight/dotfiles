export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "$ZDOTDIR/aliases.zsh"
plug "$ZDOTDIR/exports.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/fnm"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"

eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

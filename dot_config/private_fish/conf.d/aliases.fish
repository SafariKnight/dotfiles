# Better defaults
alias ls="eza --group-directories-first --icons";
abbr cat bat;
abbr grep rg;
abbr find fd;
abbr less "less -r";

# Neovim
alias gdvim="nvim --listen 127.0.0.1:55432";
abbr vim "nvim"
alias ovim "NVIM_APPNAME=nvim nvim"

# Chezmoi
abbr cme "chezmoi edit"
abbr cm  "chezmoi"
abbr cdm "cd $(chezmoi source-path)"

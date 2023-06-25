export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export RUSTUP_HOME="$HOME/.dev/.rustup"
export CARGO_HOME="$HOME/.dev/.cargo"
# export PATH="$HOME/.local/share/fnm/:$PATH"
export PATH="$HOME/PATH/:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@17/include"
export EDITOR="/usr/local/bin/nvim"
eval "$(fnm env --use-on-cd)"
. $HOME/.dev/.cargo/env

# Rose-Pine FZF
# export FZF_DEFAULT_OPTS="
# 	--color=fg:#908caa,bg:#191724,hl:#ebbcba
# 	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
# 	--color=border:#403d52,header:#31748f,gutter:#191724
# 	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
# 	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# GUI
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export LIBGL_ALWAYS_INDIRECT=1

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export RUSTUP_HOME="$HOME/.dev/.rustup"
export CARGO_HOME="$HOME/.dev/.cargo"
# export PATH="$HOME/.local/share/fnm/:$PATH"
export PATH="$HOME/PATH/:$PATH"
export EDITOR="/usr/bin/nvim"
eval "$(fnm env --use-on-cd)"
. $HOME/.dev/.cargo/env

# GUI
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# export LIBGL_ALWAYS_INDIRECT=1

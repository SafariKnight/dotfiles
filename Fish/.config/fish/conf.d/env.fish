set fish_greeting
set -gx RUSTUP_HOME $HOME/dev/rustup
set -gx CARGO_HOME $HOME/dev/cargo
set -gx EDITOR nvim
# set -gx BROWSER firefox
set -gx PNPM_HOME $HOME/.local/share/pnpm
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx TMUX_TMPDIR /tmp

# # Force one to be after the other
set -gx BUN_INSTALL $HOME/dev/bun
set -gx PATH $BUN_INSTALL/bin $PATH

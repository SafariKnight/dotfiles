## ENV ##
set -gx RUSTUP_HOME .local/share/rustup
set -gx CARGO_HOME .local/share/cargo
set -gx PNPM_HOME $HOME/.local/share/pnpm

set -gx NVIM_APPNAME astronvim
set -gx EDITOR hx
set -gx VISUAL hx

## PATH ##
fish_add_path -gm ~/.local/bin

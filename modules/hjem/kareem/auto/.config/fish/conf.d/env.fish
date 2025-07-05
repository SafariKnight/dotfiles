## ENV ##
set -gx RUSTUP_HOME .local/share/rustup
set -gx CARGO_HOME .local/share/cargo
set -gx PNPM_HOME $HOME/.local/share/pnpm

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER "nvim +Man!"

## PATH ##
fish_add_path -gm ~/.local/bin

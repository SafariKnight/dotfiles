{
  writeShellApplication,
  tmux,
  fzf,
  fd,
}:
writeShellApplication {
  name = "tmux-session";
  runtimeInputs = [
    tmux
    fzf
    fd
  ];
  bashOptions = [
    "pipefail"
  ];
  text =
    /*
    bash
    */
    ''
      #/usr/bin/env bash
      declare -a SEARCH_PATHS=(~/projects)
      declare -a PATHS=(~/dotfiles)

      find_dirs() {
        if [[ -n "$TMUX" ]]; then
          CURRENT_SESSION=$(tmux display-message -p '#S')
          tmux list-sessions -F "[TMUX] #{session_name}" 2>/dev/null | rg -vFx "[TMUX] $CURRENT_SESSION"
        else
          tmux list-sessions -F "[TMUX] #{session_name}" 2>/dev/null
        fi

        for DIR in "''${PATHS[@]}"; do
          echo "''${DIR/$HOME/\~}"
        done

        for ENTRY in "''${SEARCH_PATHS[@]}"; do
          [[ -d "$ENTRY" ]] && fd . "$ENTRY"  --exact-depth 1 -H --exclude "*.git" --type d | sed "s|^$HOME|~|"
        done
      }

      has_session() {
          tmux list-sessions | grep -q "^$1"
      }

      if [[ -n "$1" ]]; then
        SELECTED="$1"
      else
        SELECTED=$(find_dirs | fzf)
      fi


      if [[ -z $SELECTED ]]; then
        exit 0
      fi

      if [[ "$SELECTED" =~ ^\[TMUX\]\ (.+)$ ]]; then
          SELECTED="''${BASH_REMATCH[1]}"
      fi

      SELECTED_NAME=$(basename "$SELECTED" | tr . _)

      if [[ -n "$TMUX" ]]; then
        tmux new-session -ds "$SELECTED_NAME" -c "''${SELECTED/\~/$HOME}" 2>/dev/null
        tmux switch-client -t "$SELECTED_NAME"
      else
        tmux new-session -As "$SELECTED_NAME" -c "''${SELECTED/\~/$HOME}"
      fi

    '';
}

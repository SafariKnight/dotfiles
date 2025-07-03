{
  writeShellApplication,
  jujutsu,
}:
writeShellApplication {
  name = "jj-push";
  runtimeInputs = [
    jujutsu
  ];
  text = ''
    #/usr/bin/env bash

    REV="$1"
    BOOKMARK="$2"

    jj bookmark s -r "$REV" "$BOOKMARK" && \
    jj bookmark track "$BOOKMARK"@origin && \
    jj git push -b "$BOOKMARK"
  '';
}

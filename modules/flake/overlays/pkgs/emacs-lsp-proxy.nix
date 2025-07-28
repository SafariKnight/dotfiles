{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "lsp-proxy";
  version = "0.5.4";

  src = fetchFromGitHub {
    owner = "jadestrong";
    repo = "lsp-proxy";
    rev = "v${version}";
    hash = "sha256-glvPMNlBqeqMT3iIdRMxtygEG+JVyOxIoy++sR0FBCA=";
  };

  cargoHash = "sha256-UxxzAvQClNotsizKLYLXW8JvVNp0Th32y/K6N3//BXU=";

  meta = {
    description = "An LSP client for Emacs implemented in Rust";
    homepage = "https://github.com/jadestrong/lsp-proxy";
    license = lib.licenses.gpl3Only;
    # maintainers = with lib.maintainers; [ ];
    mainProgram = "lsp-proxy";
  };
}

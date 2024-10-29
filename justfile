default:
 just --list

darwin-update:
  nix run --extra-experimental-features 'nix-command flakes' \
  nix-darwin -- switch --flake \
  ~/.config/darwin/. --impure #impure for builtins.currentSystem

darwin-testbuild:
  nix run --extra-experimental-features 'nix-command flakes' \
  nix-darwin -- switch --flake \
  ~/.config/darwin/. --impure --dry-run

nix-clean:
  nix store gc
  nix store optimise
  home-manager expire-generations 1
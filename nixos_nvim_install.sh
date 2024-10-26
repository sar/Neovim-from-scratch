#!/bin/sh

#nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
#nix-channel --update unstable
#nix-env -iA unstable.neovim
#nix-env -iA unstable.neovim-qt
#nix-env -iA nixos.xterm

mkdir -p ~/.config/nvim
cd ~/.config/nvim
git clone https://github.com/sar/nvim-config .
./git_sync.sh



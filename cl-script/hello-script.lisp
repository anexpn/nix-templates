#!/usr/bin/env cached-nix-shell
#| nix-shell will read the next lines no matter what, See: https://github.com/NixOS/nix/issues/2570
#!nix-shell --pure
#!nix-shell -p "sbcl"
#!nix-shell -i "sbcl --script"
#!nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz
|#

(write-line "Hello, world!")

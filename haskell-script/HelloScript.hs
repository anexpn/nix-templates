#!/usr/bin/env cached-nix-shell
#! nix-shell --pure
#! nix-shell -p "haskellPackages.ghcWithPackages (ps: with ps; [])"
#! nix-shell -i runghc
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz

main = do
  putStrLn "Hello, world!"

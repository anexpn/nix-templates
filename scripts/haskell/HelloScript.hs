#!/usr/bin/env cached-nix-shell
#! nix-shell --pure
#! nix-shell -p "ghc.withPackages (ps: with ps; [])"
#! nix-shell -i runghc
#! nix-shell -I nixpkgs=https://nixos.org/channels/nixos-23.05/nixexprs.tar.xz

main = do
  putStrLn "Hello, world!"

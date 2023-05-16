#!/usr/bin/env cached-nix-shell
#! nix-shell --pure
#! nix-shell -p "python3.withPackages (ps: with ps; [])"
#! nix-shell -i "python"
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz

# Add packages to ...(ps: with ps; [ packages... ])...
# Some useful packages:
# - typer: for cli
# - toml: parse toml file

if __name__ == "__main__":
    print("Hello, World!")

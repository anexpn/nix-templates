#!/usr/bin/env cached-nix-shell
/*
#! nix-shell --pure
#! nix-shell -p "tinycc"
#! nix-shell -i "tcc -run"
#! nix-shell -I nixpkgs=https://nixos.org/channels/nixos-23.05/nixexprs.tar.xz
*/

#include <stdio.h>

int main() { printf("Hello, world!\n"); }

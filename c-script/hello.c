#!/usr/bin/env cached-nix-shell
/*
#! nix-shell --pure
#! nix-shell -p "tinycc"
#! nix-shell -i "tcc -run"
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz
*/

#include <stdio.h>

int main() { printf("Hello, world!\n"); }

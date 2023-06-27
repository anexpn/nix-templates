#!/usr/bin/env cached-nix-shell
#if 0
#! nix-shell --pure
#! nix-shell -p "gcc"
#! nix-shell -i "bash"
#! nix-shell -I nixpkgs=https://nixos.org/channels/nixos-23.05/nixexprs.tar.xz
t=`mktemp`
sed -n '2,$p' "$0" | g++ -o "$t" -x c++ - && "$t" "$@"
r=$?
rm -f "$t"
exit $r
#endif

#include <stdio.h>

int main() { printf("Hello, world!\n"); }

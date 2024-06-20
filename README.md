# Nix Templates

These are some nix flake templates for daily developing.

```sh
nix flake show
```

lists available templates.

## Use Templates

```sh
nix flake new -t github:juxtaly/nix-templates#<template-name> <dir>

# For example

nix flake new -t github:juxtaly/nix-templates#haskell-project hs-project
```

Replace `nix flake new` with `nix flake init` to initialise in the current directory.

## Templates Types

Templates are placed in `scripts/{language}`, `projects/{language}` or `flakeonly/{language}`.

Templates in `scripts/{language}` with name `{language}-script` are self-contained scripts
which leverage "nix-shell shebang". See [Nix-shell shebang](https://nixos.wiki/wiki/Nix-shell_shebang).
However, "nix shell shebang" (not nix-shell) is only available after Nix 2.19.0, so it is not used here.

Templates in `projects/{language}` with name `{language}-project` are development scaffolds
which include not only the basic project structure in the language but also tools, tests and benchmarks.

Templates in `flakeonly/{language}` with name `{language}-flakeonly` are ... flake only. They are
useful to plug in an existing non-flake non-nix project to get the benefits of nix.

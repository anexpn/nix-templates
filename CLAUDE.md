# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of Nix flake templates for daily development across multiple languages. The repository provides three types of templates:

- **Scripts** (`scripts/{language}/`): Self-contained executable scripts using nix-shell shebang for one-off tasks
- **Projects** (`projects/{language}/`): Full development scaffolds with tools, tests, and benchmarks
- **Flake-only** (`flakeonly/{language}/`): Just flake.nix files to add Nix benefits to existing non-Nix projects

## Common Commands

### Creating New Projects from Templates
```bash
# List all available templates
nix flake show

# Create new project from template
nix flake new -t github:anexpn/nix-templates#<template-name> <dir>

# Initialize in current directory
nix flake init -t github:anexpn/nix-templates#<template-name>
```

### Development Environment Setup
```bash
# Enter development environment
nix develop

# Or use direnv (recommended)
echo "use flake" > .envrc
direnv allow
```

### Haskell Project Development

For Haskell projects created from the `haskell-project` template:

**Build and Run:**
```bash
# With Nix
nix build
nix run .#<package>

# With Cabal (inside nix develop)
cabal build
cabal run
```

**Testing:**
```bash
# Always use direct test output
cabal test --test-show-details=direct

# Run specific tests
cabal test --test-show-details=direct --test-options="--match \"some spec item\""

# Setup .hspec for rerunning failed tests
echo --failure-report .hspec-failures >> .hspec
echo --rerun >> .hspec
echo --rerun-all-on-success >> .hspec
```

**Benchmarking:**
```bash
cabal bench

# With options
cabal bench --benchmark-options="--output output.html"
```

### Script Execution

Scripts in `scripts/` directories use nix-shell shebang and can be executed directly:
```bash
# Make executable and run
chmod +x scripts/haskell/HelloScript.hs
./scripts/haskell/HelloScript.hs
```

## Architecture

### Template Structure
- **Root flake.nix**: Aggregates templates from multiple sources (dev-templates, devshell, jupyenv) plus custom templates
- **Template Organization**: 
  - Scripts are self-contained with nix-shell shebangs
  - Projects use haskell-flake for comprehensive Haskell development environments
  - Flake-only templates provide minimal Nix integration

### Haskell Project Architecture
- Uses **haskell-flake** for standardized Haskell project structure
- **Relude** as alternative Prelude with mixins configuration
- Standard project layout: `src/`, `app/`, `test/`, `bench/`
- Test convention: For each `Module.hs` in `src/`, create `ModuleSpec.hs` in `test/`
- Development tools included: fourmolu (formatter), haskell-language-server, hlint

### Nix Integration
- Pinned to nixos-24.05 for stability
- Uses flake-parts for modular flake organization
- Development shells include language-specific tooling
- Scripts use `cached-nix-shell` for faster startup

## Testing Conventions

### Haskell Projects
- Use Hspec for testing framework
- Always run tests with `--test-show-details=direct`
- Follow `ModuleSpec.hs` naming convention for test files
- Use QuickCheck for property-based testing
- Criterion for benchmarking with attention to outlier variance

## Development Notes

- All Haskell projects use GHC2021 language standard
- Relude replaces Prelude for better defaults
- Fourmolu is the configured formatter
- Scripts target nixos-24.05 channel for reproducibility
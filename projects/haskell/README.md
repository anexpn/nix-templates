# Example Haskell Project

## Get Started

```sh
nix develop

# Or

echo "use flake" > .envrc
direnv allow
```

Build

```sh
nix build
nix build .#<package>

# Or

cabal build
```

Run

```sh
nix run .#<package>

# Or

cabal run
```

## Testing

```sh
cabal test --test-show-details=direct
```

Always specify `--test-show-details=direct`.
Use `--test-option` to pass command-line options to Hspec.

```sh
cabal test --test-show-details --test-option=--format=progress --test-option=--match --test-option="some spec item"
# Or
cabal test --test-show-details --test-options="--format=progress --match \"some spec item\""
```

Useful Hspec config file for rerunning failed tests only.

```sh
echo --failure-report .hspec-failures >> .hspec
echo --rerun >> .hspec
echo --rerun-all-on-success >> .hspec
```

Whenever a `Module.hs` is added to `src/`, a `ModuleSpec.hs` should be added to `test/`.
`Nested/Module.hs` -> `Nested/ModuleSpec.hs`.

## Benchmark

```sh
cabal bench
```

Use `--benchmark-option` or `--benchmark-options` to pass command-line options to criterion.

```sh
cabal bench --benchmark-options="--output output.html"
cabal bench --benchmark-options="--help"
cabal bench --benchmark-options="\"match this\""
```

Be aware of high values of “variance introduced by outliers”. It indicates bogus results
caused by the running environment or compiler opimizations.
See [Beware "pretend" I/O](http://www.serpentine.com/criterion/tutorial.html#beware-pretend-io).

## References

[haskell-flake](https://flake.parts/options/haskell-flake)

[haskell-template](https://srid.ca/haskell-template)

[Hspec](https://hspec.github.io/)

[Criterion](http://www.serpentine.com/criterion/tutorial.html)

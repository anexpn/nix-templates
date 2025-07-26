{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;

      perSystem = {
        self',
        pkgs,
        config,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          name = "python-dev";
          packages = with pkgs; [
            # uv for fast Python package management
            uv
            # Python interpreter
            python3
            # Development tools
            ruff # Fast Python linter and formatter
            python3Packages.mypy # Type checker
          ];

          shellHook = ''
            echo "Python development environment with uv"
            echo "Available commands:"
            echo "  uv init          - Initialize a new Python project"
            echo "  uv add <package> - Add a dependency"
            echo "  uv run <command> - Run a command in the project environment"
            echo "  uv sync          - Install dependencies from uv.lock"
            echo "  ruff check       - Lint code"
            echo "  ruff format      - Format code"
            echo "  mypy .           - Type check code"
          '';
        };

        packages.default = pkgs.python3Packages.buildPythonApplication {
          pname = "my-python-app";
          version = "0.1.0";
          src = ./.;
          format = "pyproject";
          nativeBuildInputs = with pkgs.python3Packages; [
            setuptools
            wheel
          ];
          propagatedBuildInputs = with pkgs.python3Packages; [
            # Add your dependencies here
          ];
        };
      };
    };
}
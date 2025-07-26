{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    devShells = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        name = "python-uv-env";
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
          echo "Run 'uv init' to initialize a new Python project"
          echo "Run 'uv sync' to install dependencies from existing project"
        '';
      };
    });
  };
}
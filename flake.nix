{
  description = "My collection of other flake templates";
  inputs.nixos-templates.url = "github:NixOS/templates";
  inputs.devshell.url = "github:numtide/devshell";
  inputs.jupyenv.url = "github:tweag/jupyenv";
  outputs = {
    self,
    nixos-templates,
    devshell,
    jupyenv,
  }: {
    templates =
      nixos-templates.templates
      // {
        devshell = devshell.templates.default;
        jupyenv = jupyenv.templates.default;
        python-script = {
          path = ./scripts/python;
          description = "Python self-contained script template";
        };
        haskell-script = {
          path = ./scripts/haskell;
          description = "Haskell self-contained script template";
        };
        cl-script = {
          path = ./scripts/cl;
          description = "Common lisp (sbcl) self-contained script template";
        };
        c-script = {
          path = ./scripts/c;
          description = "C self-contained script template";
        };
        haskell-project = {
          path = ./projects/haskell;
          description = "Haskell project template with sensible defaults";
        };
      };
    defaultTemplate = self.templates.trivial;
  };
}

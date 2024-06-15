{
  description = "My collection of other flake templates";
  inputs.devshell.url = "github:numtide/devshell";
  inputs.jupyenv.url = "github:tweag/jupyenv";
  inputs.dev-templates.url = "github:the-nix-way/dev-templates";
  outputs = {
    self,
    devshell,
    jupyenv,
    dev-templates,
  }: {
    templates = dev-templates.templates // {
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
  };
}

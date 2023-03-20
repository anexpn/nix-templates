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
      };
    defaultTemplate = self.templates.trivial;
  };
}

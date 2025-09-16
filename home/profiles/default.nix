{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "yogansh@thinkpad" = [
      ../.
      ./thinkpad
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "yogansh_thinkpad" = homeManagerConfiguration {
        modules = homeImports."yogansh@thinkpad";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}

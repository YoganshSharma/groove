{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "yogansh@tengoku" = [
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
      "yogansh@tengoku" = homeManagerConfiguration {
        modules = homeImports."yogansh@tengoku";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}

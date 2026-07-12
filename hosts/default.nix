{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get the basic config to build on top of
    inherit (import "${self}/system") desktop laptop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    thinkpad = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ laptop
        ++ [
          ./thinkpad
          "${mod}/programs/gamemode.nix"
          "${mod}/services/gnome-services.nix"
          "${mod}/services/location.nix"
          "${mod}/core/limine.nix"
          {
            home-manager = {
              users.yogansh.imports =
                homeImports."yogansh@thinkpad";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
          inputs.stevenhosts.nixosModule
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
        {
          networking.stevenBlackHosts = {
            enable = true;
            # optionally:
            enableIPv6 = true;
            blockFakenews = true;
            blockGambling = true;
            blockPorn = true;
            blockSocial = true;
          };
        }
        ];
    };

    asus = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ laptop
        ++ [
          ./asus
          "${mod}/programs/gamemode.nix"
          "${mod}/services/gnome-services.nix"
          "${mod}/services/location.nix"
          "${mod}/core/limine.nix"
          {
            home-manager = {
              users.yogansh.imports =
                homeImports."yogansh@ten";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
          inputs.stevenhosts.nixosModule
          #inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
        {
          networking.stevenBlackHosts = {
            enable = true;
            # optionally:
            enableIPv6 = true;
            blockFakenews = true;
            blockGambling = true;
            blockPorn = true;
            blockSocial = true;
          };
        }
        ];
    };
  };
}

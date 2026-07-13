{
  description = "Yogansh Configuration NixOs.";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./home/profiles
        ./hosts
        ./pkgs
      ];

      perSystem =
        {
          config,
          pkgs,
          ...
        }:
        {
          devShells = {
            default = pkgs.mkShell {
              packages = [
                pkgs.alejandra
                pkgs.git
                config.packages.repl
              ];
              name = "nixland";
              DIRENV_LOG_FORMAT = "";
            };
          };
          # Nix Formatter
          formatter = pkgs.alejandra;
        };
    };

  inputs = {
    # global, so they can be `.follow`ed
    systems.url = "github:nix-systems/default-linux";

    flake-compat.url = "github:edolstra/flake-compat";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # rest of inputs, alphabetical order
    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "hm";
        systems.follows = "systems";
      };
    };

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kixvim = {
      url = "github:YoganshSharma/kixvim";
      # inputs.nixpkgs.follows = "nixpkgs"; #refer last para of https://nix.dev/manual/nix/2.24/command-ref/new-cli/nix3-flake.html#flake-inputs and https://github.com/YoganshSharma/kixvim/blob/ab853ff47eb3c9608bdb272340da47943eaa4184/README.md#snowflake-nixos-with-flakes using overlays instead of this

    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sessionizer = {
      url = "github:YoganshSharma/tmux-sessionizer";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stevenhosts = {
      url = "github:StevenBlack/hosts"; # or a fork/mirror
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:pfaj/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
}

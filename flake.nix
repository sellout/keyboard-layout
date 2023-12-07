{
  description = "Various hardware and software keyboard layouts";

  nixConfig = {
    ## https://github.com/NixOS/rfcs/blob/master/rfcs/0045-deprecate-url-syntax.md
    extra-experimental-features = ["no-url-literals"];
    extra-substituters = ["https://cache.garnix.io"];
    extra-trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
    ## Isolate the build.
    registries = false;
    ## Until we get rid of `_noChroot`.
    sandbox = false;
  };

  outputs = {
    bash-strict-mode,
    flake-utils,
    flaky,
    nixpkgs,
    self,
  }: let
    pname = "keyboard-layout";
  in
    {
      schemas = {
        inherit
          (flaky.schemas)
          overlays
          homeConfigurations
          packages
          devShells
          projectConfigurations
          checks
          formatter
          ;
      };

      overlays.default = final: prev: {
        inherit (self.packages.${final.system}) universal-keyboard-layout;
      };

      homeConfigurations =
        builtins.listToAttrs
        (builtins.map
          (flaky.lib.homeConfigurations.example pname self [])
          flake-utils.lib.defaultSystems);
    }
    // flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      src = pkgs.lib.cleanSource ./.;
    in {
      packages = {
        default = self.packages.${system}.universal-keyboard-layout;

        "universal-keyboard-layout" =
          bash-strict-mode.lib.checkedDrv pkgs
          (pkgs.stdenv.mkDerivation {
            inherit pname src;

            nativeBuildInputs = [pkgs.perl];

            version = "0.1.0";

            buildPhase = ''
              cp -r "$src/software" .
              chmod -R +w software
              cd software
              (set +o nounset; patchShebangs --build ./generate_xmodmap.pl)
              ./generate_xmodmap.pl
            '';

            installPhase = ''
              cp -r build "$out"
            '';
          });
      };

      devShells = self.projectConfigurations.${system}.devShells;

      projectConfigurations =
        flaky.lib.projectConfigurations.default {inherit pkgs self;};

      checks = self.projectConfigurations.${system}.checks;

      formatter = self.projectConfigurations.${system}.formatter;
    });

  inputs = {
    bash-strict-mode = {
      inputs = {
        flake-utils.follows = "flake-utils";
        flaky.follows = "flaky";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:sellout/bash-strict-mode";
    };

    flake-utils.url = "github:numtide/flake-utils";

    flaky = {
      inputs = {
        bash-strict-mode.follows = "bash-strict-mode";
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:sellout/flaky";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
  };
}

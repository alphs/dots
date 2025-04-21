# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    user = "aaa";

    nonicons-overlay = final: prev: {
      nonicons = final.callPackage ./nix/overlays/nonicons.nix {};
    };

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ nonicons-overlay ];
    };

  in
  {
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = [
        ./nix/hosts/wsl.nix
        inputs.home-manager.nixosModules.home-manager
        {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];

          users.users."${user}".shell = pkgs.zsh;
          programs.zsh.enable = true;

          home-manager = {
            extraSpecialArgs = { inherit pkgs user inputs; isNixos = true; isWsl = true; };
            users."${user}" = ./nix/home.nix;
          };
        }

      ];
    };

# ---------------------

    homeConfigurations."${user}" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit pkgs user inputs; isNixos = false; };
      modules = [
        ./nix/home.nix
      ];
    };
  };
}

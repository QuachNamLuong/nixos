{
  description = "NixOS config with Home Manager";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" "https://umbriel.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw=" ];
    trusted-users = [ "root" "@wheel" "luong" ]; 
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    umbriel.url = "github:noctalia-dev/umbriel/cachix";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nixvim.url = "github:nix-community/nixvim";
  };
  
  outputs = inputs @ { 
    self, 
    nixpkgs, 
    home-manager, 
    noctalia, 
    umbriel, 
    nix-flatpak, 
    nix-vscode-extensions,
    nixvim,
    ...
    }:
    let
      stateVersion = "26.05";
      username = "luong";
      host = "laptop";
    in
      {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs stateVersion username host; }; 
        modules = [
          ./modules
          ./host/${host}
          {
            nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs stateVersion username host; }; 
              users.${username} = import ./home;
            };
          }
        ];
      };
    };
}
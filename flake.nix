{
  description = "NixOS config with Home Manager";

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org" 
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];

    trusted-substituters = [
      "https://noctalia.cachix.org"
      "https://cache.nixos.org/" 
    ];

    extra-trusted-public-keys = [ 
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    trusted-users = [ "root" "@wheel" "luong" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umbriel  = {
      url = "github:noctalia-dev/umbriel";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs @ { 
    self, 
    nixpkgs, 
    home-manager, 
    noctalia, 
    noctalia-greeter, 
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
          nix-flatpak.nixosModules.nix-flatpak
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
{
  description = "NixOS config with Home Manager";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umbriel  = {
      url = "github:noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = inputs @ { 
    self, 
    nixpkgs, 
    home-manager, 
    noctalia, 
    noctalia-greeter, 
    umbriel, 
    nix-flatpak, 
    flake-utils, 
    nix-vscode-extensions, 
    ...
    }:
    let
      stateVersion = "26.05";
      username = "luong";
      host = "laptop";
    in
      (flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShells.default = import ./devshell.nix { inherit pkgs stateVersion username host; };
        }
      ))
      //
      {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs stateVersion username host; }; 
        modules = [
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
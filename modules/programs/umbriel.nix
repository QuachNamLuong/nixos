{ pkgs, inputs, ... }:

{
  # imports = [ inputs.umbriel.nixosModules.default ];

  environment.systemPackages = with pkgs; [
    umbriel
  ];

  programs.umbriel.enable = true;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    SDL_VIDEODRIVER = "wayland";
  };
}

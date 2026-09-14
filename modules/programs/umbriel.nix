{ pkgs, inputs, ... }:

{
  imports = [ inputs.umbriel.nixosModules.default ];

  programs.umbriel.enable = true;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    SDL_VIDEODRIVER = "wayland";
  };
}

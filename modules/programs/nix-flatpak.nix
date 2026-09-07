{ pkgs, inputs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "gtk" ];
  };
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
    update.onActivation = true;
  };
}

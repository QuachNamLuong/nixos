{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus
    libheif
    libheif.out
  ];
  environment.pathsToLink = [ "share/thumbnailers" ];

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];
}

{ pkgs, ... }:
{
  virtualisation.waydroid.enable = true;
  # Newer kernel versions may need
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  
  environment.systemPackages =  [ pkgs.waydroid-helper, pkgs.wl-clipboard ];

  systemd = {
    packages = [ pkgs.waydroid-helper ];
    services.waydroid-mount.wantedBy = [ "multi-user.target" ];
  };
}
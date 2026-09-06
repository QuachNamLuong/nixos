{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ libsecret ];
  services.gnome.gnome-keyring.enable = true;
}

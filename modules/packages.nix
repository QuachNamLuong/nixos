{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    vlc
    android-studio
    chromium
    kitty
    yazi
  ];
}
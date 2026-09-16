{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    vlc
    android-studio
    chromium
    alacritty
    remmina
    discord-ptb
  ];
}
{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    vlc
    android-studio
    chromium
    kitty
    remmina
    discord-ptb
    rustdesk-flutter
    yazi
  ];
}
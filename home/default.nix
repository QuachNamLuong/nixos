{ stateVersion, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.home-manager.enable = true;
  home.stateVersion = stateVersion;

  imports = [
    ./programs
  ];
}

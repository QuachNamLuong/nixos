{ pkgs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "Quach Nam Luong";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    packages = with pkgs; [];
  };
}

{ ... }: 
{
  imports = [
    ./graphics
    ./laptop

    ./audio.nix
    ./battery.nix
    ./bluetooth.nix
    ./touchpad.nix
    ./webcam.nix
  ];
}
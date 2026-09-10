{ ... }: 
{
  imports = [
    ./graphics
    ./laptop

    ./audio.nix
    ./power.nix
    ./bluetooth.nix
    ./touchpad.nix
    ./webcam.nix
  ];
}
{ ... }: 
{
  imports = [
    ./graphics

    ./battery.nix
    ./audio.nix
    ./power.nix
    ./bluetooth.nix
    ./webcam.nix
  ];
}
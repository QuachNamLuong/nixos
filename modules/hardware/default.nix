{ ... }: 
{
  imports = [
    ./graphics
    ./laptop

    ./audio.nix
    ./power.nix
    ./bluetooth.nix
    ./webcam.nix
  ];
}
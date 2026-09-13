{ ... }: 
{
  imports = [
    ./graphics
    ./laptop
    #./desktop

    ./audio.nix
    ./power.nix
    ./bluetooth.nix
    ./webcam.nix
  ];
}
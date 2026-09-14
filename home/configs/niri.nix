{ ... }:
{
  programs.niri = {
    enable = true;

    settings = {
      spawn-at-startup = [
        "noctalia"
      ]
    }
  }
}
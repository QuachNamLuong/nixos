{ inputs, pkgs, ... }:

{
  imports = [ inputs.noctalia-greeter.nixosModules.default ];
  
  programs.noctalia-greeter = {
    enable = true;
    
    settings = {
      session = {
        default = "niri";
      };

      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };

      keyboard = {
        layout = "us";
      };

      output.scale = "eDP-1:1.2";
    };
  };
}

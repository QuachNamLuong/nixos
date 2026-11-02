{ inputs, pkgs, config, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;
    
    settings = {
      session = {
        default = "umbriel";
      };

      keyboard = {
        layout = "us";
      };

      output.scales = "eDP-1:1.2";
    };
  };
}

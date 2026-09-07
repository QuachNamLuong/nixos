{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    
    settings = {
      theme = {
        mode = "dark";
        shell_mode = "follow";
        source = "built-in";
        built_in_palette = "Tokyo Night";
      };  

      bar.default = {
          position = "top"; 
          thickness = 24;
          padding = 10;
          widget_spacing = 8;
          start = [ "workspaces" "wallpaper" "screen_recorder" ];
          center = [ "clock" ];
          end = [ "tray" "bluetooth" "network" "volume" "battery" "session" ];
        };

      

      plugins = {
        auto_update = "all";
        enabled = ["noctalia/screen_recorder"];

        sources = [
          {
            name = "official";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            enable = true;
          }
          {
            name = "community";
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            enable = true;
          }
        ];
      };
    };
  };
}

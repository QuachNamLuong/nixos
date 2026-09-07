{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    
    settings = {
      bar.default = {
          position = "top";        # Options: "top", "bottom", "left", "right"
          thickness = 24;
          padding = 10;
          widget_spacing = 8;

          # Layout sections (left/top, center, right/bottom)
          start = [ "workspaces" "wallpaper" ];
          center = [ "clock" ];
          end = [ "tray" "bluetooth" "network" "volume" "battery" "session" ];
        };

      plugins = {
        auto_update = "all";
        enable = [
          "noctalia/screen_recorder"
          "levi/warp"
        ];

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

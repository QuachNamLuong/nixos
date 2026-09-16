# home.nix
{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      general.layout = "scrolling";

      scrolling = {
        column_width = 0.8;               # Column width ratio relative to screen (0.1 to 1.0)
        direction = "right";              # Direction new windows spawn ("right", "left", "up", "down")
        fullscreen_on_one_column = true; # Focus single app in column fullscreen
      };

      monitor = [
        ",preferred,auto,1"
      ];

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, dolphin"
        "$mod, V, togglefloating,"
        "$mod, R, exec, wofi --show drun"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };
    };
  };
}
{ pkgs, inputs, ... }: {
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        autostart = [ "noctalia" "fcitx5 -d" ];
        mod_key = "Super";
        xwayland = true;
      };

      layout.gap = 5;

      input.keyboard.layout = "us";

      keybinds = {
        "Mod+T" = "spawn:alacritty";
        "Mod+B" = "spawn:chromium";
        "Mod+Q" = "window-close";
        "Mod+C" = "window-center";
        "Mod+F" = "window-toggle-maximize";
        "Mod+Shift+F" = "window-toggle-fullscreen";
        "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
        "Mod+E" = "spawn:nautilus";
        "Mod+Left" = "window-focus-left";
        "Mod+Right" = "window-focus-right";
        "Print" = "spawn:noctalia msg screenshot-region";
        "Ctrl+Print" = "spawn:noctalia msg screenshot-fullscreen";
        "Mod+Tab" = "overview-toggle";
        "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up 5%";
        "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down 5%";
        "XF86AudioMute" = "spawn:noctalia msg volume-mute";
        "XF86AudioMicMute" = "spawn:noctalia msg mic-mute";
        "XF86MonBrightnessUp" = "spawn:noctalia msg brightness-up 5";
        "XF86MonBrightnessDown" = "spawn:noctalia msg brightness-down 5";
      };

      output = {
        eDP-1 = {
          mode = "1920x1080@60";
          scale = 1.2;
        };
      };
    };
  };
}
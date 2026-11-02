{ pkgs, inputs, config, ... }: {
  # # Keep `config` even if unused; it is needed to generate config.toml.
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;

    settings = {
      include = {
        files = [];
        optional = {
          files = [];
        };
      };

      appearance = {
        blur = {
          radius = 3;
        };
      };

      input = {
        keyboard = {
          numlock_toggle = true;
        };
      };

      general = {
        autostart = [
          "noctalia"
          "fcitx5 -d"
        ];
        xwayland = true;
        xwayland_native_resolution = false;
        mod_key = "Super";
        honor_restored_maximize = true;
      };

      keybinds = {
        "XF86AudioRaiseVolume" = { action = "spawn:noctalia msg volume-up"; allow_when_locked = true; };
        "XF86AudioLowerVolume" = { action = "spawn:noctalia msg volume-down"; allow_when_locked = true; };
        "XF86AudioMute" = { action = "spawn:noctalia msg volume-mute"; allow_when_locked = true; repeat = false; };

        # Chụp màn hình: repeat = false để tránh bấm giữ chụp liên tục
        "Print" = { action = "spawn:noctalia msg screenshot-region"; repeat = false; };
        "Shift+Print" = { action = "spawn:noctalia msg screenshot-fullscreen"; repeat = false; };
        "Alt+Print" = { action = "spawn:noctalia msg screenshot-window"; repeat = false; };
        "Mod+Print" = { action = "spawn:noctalia msg screenshot-annotate"; repeat = false; };

        # Applications and session
        "Mod+Return" = { action = "spawn:kitty"; repeat = false; };
        "Mod+B" = { action = "spawn:chromium"; repeat = false; };
        "Mod+E" = { action = "spawn:kitty -e yazi"; repeat = false; };
        "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
        "Mod+Q" = { action = "window-close"; repeat = false; };
        "Mod+Escape" = "session-quit";
        "Mod+Shift+Escape" = {
          action = "shortcuts-inhibit-toggle";
          allow_when_inhibited = true;
          repeat = false;
        };

        # Focus and movement
        "Mod+Left" = "window-focus-left";
        "Mod+Down" = "window-focus-down";
        "Mod+Up" = "window-focus-up";
        "Mod+Right" = "window-focus-right";
        "Mod+H" = "window-focus-left";
        "Mod+J" = "window-focus-down";
        "Mod+K" = "window-focus-up";
        "Mod+L" = "window-focus-right";
        "Mod+F1" = "window-focus-next";
        "Mod+Shift+Left" = "column-move-left";
        "Mod+Shift+Down" = "window-move-down";
        "Mod+Shift+Up" = "window-move-up";
        "Mod+Shift+Right" = "column-move-right";

        # Window state and layout
        "Mod+T" = { action = "window-toggle-floating"; repeat = false; };
        "Mod+Shift+T" = { action = "window-focus-switch-floating"; repeat = false; };
        "Mod+P" = { action = "window-toggle-pinned"; repeat = false; };
        "Mod+M" = { action = "window-toggle-maximize-to-edges"; repeat = false; };
        "Mod+F" = { action = "window-toggle-fullscreen"; repeat = false; };
        "Mod+Ctrl+F" = { action = "window-toggle-maximize"; repeat = false; };
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+Comma" = "window-consume-left";
        "Mod+Period" = "window-consume-right";
        "Mod+W" = { action = "column-toggle-tabbed"; repeat = false; };
        "Mod+Alt+Right" = "column-focus-tab-next";
        "Mod+Alt+Left" = "column-focus-tab-previous";
        "Mod+WheelUp" = "window-focus-left";
        "Mod+WheelDown" = "window-focus-right";
        "Mod+O" = { action = "overview-toggle"; repeat = false; };

        # Workspaces
        "Mod+1" = "workspace-switch:1";
        "Mod+2" = "workspace-switch:2";
        "Mod+3" = "workspace-switch:3";
        "Mod+4" = "workspace-switch:4";
        "Mod+5" = "workspace-switch:5";
        "Mod+6" = "workspace-switch:6";
        "Mod+7" = "workspace-switch:7";
        "Mod+8" = "workspace-switch:8";
        "Mod+9" = "workspace-switch:9";
        "Mod+Shift+1" = "window-move-to-workspace:1";
        "Mod+Shift+2" = "window-move-to-workspace:2";
        "Mod+Shift+3" = "window-move-to-workspace:3";
        "Mod+Shift+4" = "window-move-to-workspace:4";
        "Mod+Shift+5" = "window-move-to-workspace:5";
        "Mod+Shift+6" = "window-move-to-workspace:6";
        "Mod+Shift+7" = "window-move-to-workspace:7";
        "Mod+Shift+8" = "window-move-to-workspace:8";
        "Mod+Shift+9" = "window-move-to-workspace:9";

        # Scratchpad
        "Mod+Shift+Space" = { action = "window-move-to-scratchpad"; repeat = false; };
        "Mod+Space" = "scratchpad-toggle";
        "Mod+Ctrl+Space" = { action = "window-restore-from-scratchpad"; repeat = false; };
        "Mod+Tab" = "scratchpad-focus-next";
      };

      layout = {
        extent_presets = [ 0.333 0.5 0.667 ];
        scrolling = {
          default_extent_fraction = 0.5;
        };
      };

      window_rule = [
        {
          blur = true;
          blur_optimized = false;
        }
        {
          match = {
            app_id = "^dev.noctalia.Noctalia$";
          };
          default_floating = true;
          default_floating_size_px = { width = 1020; height = 900; };
        }
        {
          match = {
            app_id = "^dev.noctalia.UmbrielSharePicker$";
          };
          default_floating = true;
          default_floating_size_px = { width = 800; height = 600; };
        }
        {
          match = {
            title = "^(Picture-in-Picture|Picture in picture)$";
          };
          default_floating = true;
          default_maximize = false;
          default_position = { x = 20; y = 20; anchor = "bottom_right"; };
        }
        {
          match = {
            title = "^notificationtoasts_.+_desktop";
          };
          default_position = { x = 0; y = 0; anchor = "bottom_right"; };
          default_focused = false;
          default_pinned = true;
        }
      ];

      layer_rule = [
        {
          match = {
            namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
          };
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_popups = true;
          blur_optimized = false;
        }
      ];

      hot_corners = {
        top_left = {
          enabled = true;
          delay_ms = 500;
          action = "overview-open";
        };
      };

      output = {
        "eDP-1" = {
          mode = "1920x1080@60";
          scale = 1.25;
        };
      };
    };
  };
}
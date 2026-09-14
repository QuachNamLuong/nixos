{ pkgs, ... }:

{
  programs.niri = {
    enable = true;

    settings = {
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];

      binds = {
        # --- Hệ thống & Tiện ích ---
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];
        "Mod+Q".action.close-window = [];
        "Mod+Shift+E".action.quit = [];

        # --- Mở ứng dụng (Tùy chỉnh theo phần mềm bạn dùng) ---
        "Mod+Return".action.spawn = [ "alacritty" ];
        "Mod+D".action.spawn = [ "fuzzel" ]; # Hoặc "rofi-wayland" / "walker"

        # --- Di chuyển tiêu điểm (Focus Navigation) ---
        "Mod+Left".action.focus-column-left = [];
        "Mod+Right".action.focus-column-right = [];
        "Mod+Down".action.focus-window-down = [];
        "Mod+Up".action.focus-window-up = [];

        # Phím Vim (H, J, K, L)
        "Mod+H".action.focus-column-left = [];
        "Mod+L".action.focus-column-right = [];
        "Mod+J".action.focus-window-down = [];
        "Mod+K".action.focus-window-up = [];

        # --- Di chuyển cột cửa sổ (Move Columns) ---
        "Mod+Shift+Left".action.move-column-left = [];
        "Mod+Shift+Right".action.move-column-right = [];

        # --- Kích thước cửa sổ ---
        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+C".action.center-column = [];

        # --- Quản lý Workspace ---
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
      };
    };
  };
}
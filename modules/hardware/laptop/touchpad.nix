{ config, lib, pkgs, ... }:
{
  # =========================================================
  # 1. KÍCH HOẠT LIBINPUT (DRIVER MẶC ĐỊNH CHO TOUCHPAD)
  # =========================================================
  # libinput là driver hiện đại, được khuyến nghị thay thế cho synaptics.
  # Trên NixOS 25.05+, tùy chọn đã được đổi tên từ services.xserver.libinput
  # sang services.libinput.
  services.libinput = {
    enable = true;

    # =====================================================
    # 2. CẤU HÌNH TOUCHPAD
    # =====================================================
    touchpad = {
      # --- Hành vi cuộn ---
      # Cuộn tự nhiên (nội dung di chuyển cùng chiều ngón tay).
      # Đây là hành vi mặc định của libinput cho touchpad.
      naturalScrolling = true;

      # --- Hành vi nhấn ---
      # Bật tap-to-click: chạm nhẹ để nhấn thay vì phải ấn vật lý.
      # Rất tiện lợi và được hầu hết người dùng ưa chuộng.
      tapping = true;

      # Phương thức nhấn: "clickfinger" cho phép dùng 2 ngón để nhấn chuột phải
      # (tương tự MacBook), thay vì phải ấn vào góc dưới bên phải.
      clickMethod = "clickfinger";

      # --- Hành vi gõ ---
      # Tắt touchpad tạm thời khi đang gõ bàn phím để tránh di chuột ngoài ý muốn.
      # Mặc định là true, nhưng bạn có thể đổi thành false nếu muốn vừa gõ vừa dùng touchpad.
      disableWhileTyping = true;

      # --- Gia tốc ---
      # "adaptive" (mặc định): gia tốc thay đổi theo tốc độ di chuyển.
      # "flat": không gia tốc, con trỏ di chuyển tuyến tính theo khoảng cách ngón tay.
      # Dùng "flat" nếu bạn muốn kiểm soát chính xác hơn (thường dân gaming ưa thích).
      accelProfile = "adaptive";

      # --- Cuộn ngang ---
      # Bật cuộn ngang bằng hai ngón tay.
      horizontalScrolling = true;

      # --- Nhấn chuột giữa ---
      # Bật mô phỏng nhấn chuột giữa bằng cách chạm 3 ngón.
      middleEmulation = true;
    };
  };

  # =========================================================
  # 3. LƯU Ý QUAN TRỌNG VỀ WAYLAND
  # =========================================================
  # Nếu bạn dùng compositor Wayland (Hyprland, Niri, Sway...), các tùy chọn
  # services.libinput có thể bị compositor ghi đè. Trong trường hợp đó,
  # hãy cấu hình touchpad trực tiếp trong file cấu hình của compositor.
  #
  # Ví dụ với Hyprland (trong home-manager):
  #
  # wayland.windowManager.hyprland.settings.input.touchpad = {
  #   natural_scroll = true;
  #   tap-to-click = true;
  #   disable_while_typing = true;
  #   clickfinger_behavior = true;
  # };
}
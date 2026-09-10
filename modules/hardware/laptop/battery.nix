{ config, lib, pkgs, ... }:
{
  # =========================================================
  # LƯU Ý: services.upower.enable ĐÃ CHUYỂN SANG power.nix
  # vì desktop cũng cần UPower cho UPS và chuột không dây.
  # Không khai báo lại ở đây để tránh trùng lặp option.
  # =========================================================

  # =========================================================
  # 1. QUẢN LÝ NĂNG LƯỢNG BẰNG TLP
  # =========================================================
  # TLP tự động điều chỉnh CPU, ổ cứng, card mạng... dựa trên nguồn điện.
  # Chỉ chạy trên laptop — desktop không có pin để quản lý.
  services.tlp = {
    enable = true;

    settings = {
      # --- Chính sách CPU khi dùng PIN ---
      # Giảm hiệu năng để tiết kiệm pin tối đa.
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_BOOST_ON_BAT = 0;              # Tắt turbo boost
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      # --- Chính sách CPU khi cắm SẠC ---
      # Cho phép hiệu năng tối đa.
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_BOOST_ON_AC = 1;               # Bật turbo boost
      CPU_HWP_DYN_BOOST_ON_AC = 1;

      # --- Ngưỡng sạc pin (bảo vệ tuổi thọ pin) ---
      # Pin bắt đầu sạc khi dưới 75%, ngừng sạc khi đạt 80%.
      # Giữ pin trong khoảng này giúp kéo dài tuổi thọ đáng kể.
      #
      # Lưu ý: Không phải laptop nào cũng hỗ trợ. Nếu không thấy
      # hiệu quả, hãy kiểm tra bằng `sudo tlp-stat -b`.
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      # --- Tiết kiệm điện cho ổ cứng khi dùng pin (tùy chọn) ---
      # DISK_APM_LEVEL_ON_BAT = "128 128";

      # --- Tắt đèn bàn phím khi dùng pin (tùy chọn, tùy máy) ---
      # KBD_BACKLIGHT_ON_BAT = 0;
    };
  };

  # =========================================================
  # 2. VÔ HIỆU HÓA CÁC CÔNG CỤ XUNG ĐỘT
  # =========================================================
  # TLP xung đột với power-profiles-daemon (thường được GNOME/KDE yêu cầu).
  # Phải tắt PPD để tránh hai công cụ tranh nhau quản lý năng lượng.
  services.power-profiles-daemon.enable = false;
}
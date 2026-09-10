{ pkgs, ... }:
{
  # =========================================================
  # 1. RTKIT — Cho phép PipeWire dùng realtime scheduler
  # =========================================================
  # Giúp giảm độ trễ và tăng độ ổn định khi xử lý âm thanh.
  # Đây là gói được khuyến nghị trong hầu hết cấu hình PipeWire.
  security.rtkit.enable = true;

  # =========================================================
  # 2. PIPEWIRE — Sound server chính
  # =========================================================
  services.pipewire = {
    enable = true;

    # --- Tương thích ALSA ---
    alsa.enable = true;
    # Hỗ trợ ứng dụng 32-bit (Wine, Steam, game cũ)
    alsa.support32Bit = true;

    # --- Tương thích PulseAudio ---
    # Hầu hết ứng dụng desktop (Firefox, Discord, Spotify) dùng PulseAudio API.
    # Bật tùy chọn này để chúng hoạt động mà không cần sửa gì.
    pulse.enable = true;

    # --- Tương thích JACK (Tùy chọn) ---
    # Bật nếu bạn dùng phần mềm âm thanh chuyên nghiệp (Ardour, Carla, Guitarix).
    # jack.enable = true;

    # --- WirePlumber — Session Manager ---
    wireplumber = {
      enable = true;

      # =====================================================
      # 3. BLUETOOTH ENHANCEMENTS — Cải thiện chất lượng âm thanh
      # =====================================================
      # Mặc định NixOS 24.05+ đã bật hầu hết codec tốt, nhưng thêm
      # cấu hình này để đảm bảo SBC-XQ và mSBC hoạt động ổn định.
      extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;   # Chất lượng cao khi nghe nhạc
          "bluez5.enable-msbc" = true;     # Chất lượng tốt hơn khi gọi điện
          "bluez5.enable-hw-volume" = true; # Điều khiển âm lượng phần cứng
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };
    };
  };

  # =========================================================
  # 4. CÔNG CỤ HỮU ÍCH (Tùy chọn)
  # =========================================================
  # pavucontrol: Giao diện đồ họa để quản lý âm thanh (thiết bị, ứng dụng)
  # helvum:     Giao diện kéo-thả để định tuyến luồng âm thanh
  # environment.systemPackages = with pkgs; [
  #   pavucontrol
  #   helvum
  # ];
}
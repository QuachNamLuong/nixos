{ pkgs, ... }:
{
  # =========================================================
  # 1. KÍCH HOẠT DỊCH VỤ BLUETOOTH
  # =========================================================
  hardware.bluetooth = {
    enable = true;

    # Tự động bật Bluetooth khi khởi động máy.
    # Rất tiện lợi cho laptop, giúp tai nghe/chuột kết nối ngay.
    powerOnBoot = true;

    # =====================================================
    # 2. CẤU HÌNH NÂNG CAO (BLUEZ DAEMON)
    # =====================================================
    settings = {
      General = {
        # Hiển thị mức pin của thiết bị Bluetooth (tai nghe, chuột...).
        # Tính năng này đã ổn định trên NixOS 25.05+.
        Experimental = true;

        # Cho phép thiết bị Bluetooth tự động kết nối lại khi có mặt.
        # Hữu ích cho tai nghe, bàn phím, chuột.
        FastConnectable = true;

        # Tự động chấp nhận ghép nối từ thiết bị đã từng kết nối.
        # Giảm bớt thao tác xác nhận phiền phức.
        JustWorksRepairing = "always";
      };

      Policy = {
        # Tự động bật lại Bluetooth controller nếu bị tắt.
        AutoEnable = true;
      };
    };
  };

  # =========================================================
  # 3. GIAO DIỆN QUẢN LÝ BLUETOOTH (TÙY CHỌN)
  # =========================================================
  # Blueman là GUI nhẹ, hoạt động tốt trên Wayland.
  # Nếu bạn dùng GNOME/KDE, chúng đã có sẵn GUI riêng, có thể bỏ qua.
  # services.blueman.enable = true;

  # =========================================================
  # 4. CÔNG CỤ DÒNG LỆNH (TÙY CHỌN)
  # =========================================================
  # bluez cung cấp bluetoothctl — công cụ dòng lệnh mạnh mẽ
  # để ghép nối và gỡ lỗi thiết bị Bluetooth.
  # environment.systemPackages = with pkgs; [
  #   bluez
  # ];
}
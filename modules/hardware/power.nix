{ config, lib, pkgs, ... }:
{
  # =========================================================
  # 1. UPower — Quản lý thiết bị nguồn
  # =========================================================
  # Cung cấp thông tin về pin, UPS, chuột không dây có pin...
  # Desktop environment (GNOME, KDE, Noctalia) cần dịch vụ này
  # để hiển thị trạng thái nguồn. Hoạt động trên cả laptop và desktop.
  services.upower.enable = true;

  # =========================================================
  # 2. LOGIND — Quản lý phiên làm việc và hành vi nguồn
  # =========================================================
  services.logind = {
    # --- Hành vi khi gập nắp (chỉ có ý nghĩa trên laptop) ---
    # "suspend": ngủ (mặc định, tiết kiệm pin)
    # "hibernate": ngủ đông (ghi RAM ra đĩa, an toàn hơn)
    # "hybrid-sleep": ngủ + ngủ đông song song
    # "lock": chỉ khóa màn hình, không ngủ
    # "ignore": không làm gì (hữu ích khi cắm màn hình ngoài)
    # "poweroff": tắt máy
    lidSwitch = "suspend";

    # Khi gập nắp VÀ đang cắm sạc. Mặc định thường là "suspend".
    # Nếu bạn muốn laptop tiếp tục chạy khi cắm màn hình ngoài,
    # đổi thành "ignore" hoặc "lock".
    lidSwitchExternalPower = "suspend";

    # --- Hành vi nút nguồn (cả laptop và desktop) ---
    # "poweroff": tắt máy ngay
    # "reboot": khởi động lại
    # "suspend": ngủ
    # "hibernate": ngủ đông
    # "ignore": bỏ qua, để desktop environment xử lý (hiện menu)
    powerKey = "ignore";

    # Hành vi khi GIỮ nút nguồn lâu (thường > 5 giây).
    # "poweroff" là an toàn nhất, tránh treo máy.
    powerKeyLongPress = "poweroff";

    # # --- Hành vi khi nhấn nút suspend chuyên dụng (nếu có) ---
    # suspendKey = "suspend";
    # suspendKeyLongPress = "poweroff";

    # # --- Hành vi nút hibernate chuyên dụng (nếu có) ---
    # hibernateKey = "hibernate";
    # hibernateKeyLongPress = "poweroff";

    # --- Xử lý khi hết pin (chỉ có ý nghĩa trên laptop) ---
    # Mặc định của systemd là "poweroff" — tắt máy an toàn.
    # Bạn có thể đổi thành "hibernate" nếu đã cấu hình swap đủ lớn
    # (xem phần 3 bên dưới).
    #
    # extraConfig = ''
    #   HandlePowerKey=hibernate
    #   HandleLidSwitch=hibernate
    #   HandleLidSwitchExternalPower=ignore
    # '';

    # --- Khóa phiên khi suspend (tùy chọn) ---
    # Tự động khóa màn hình khi máy ngủ để bảo mật.
    # Tính năng này thường do desktop environment xử lý
    # (GNOME, KDE, Noctalia đều có sẵn).
    # extraConfig = ''
    #   HandleLidSwitch=suspend
    #   HandleLidSwitchExternalPower=suspend
    #   HandleSuspendKey=suspend
    #   HandleHibernateKey=hibernate
    #   IdleAction=ignore
    # '';
  };
}
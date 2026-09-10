{ pkgs, username, ... }:
{
  # =========================================================
  # 1. CẤP QUYỀN TRUY CẬP WEBCAM CHO NGƯỜI DÙNG
  # =========================================================
  # Mặc định, thiết bị video (/dev/video*) thuộc nhóm "video".
  # Thêm người dùng vào nhóm này để không cần quyền root khi dùng webcam.
  users.users.${username}.extraGroups = [ "video" ];

  # =========================================================
  # 2. DRIVER VÀ FIRMWARE (CHỈ KHI CẦN)
  # =========================================================
  # Hầu hết webcam USB dùng driver uvcvideo có sẵn, không cần cấu hình thêm.

  # --- Webcam FaceTime HD (MacBook) ---
  # hardware.facetimehd.enable = true;
  # hardware.facetimehd.withCalibration = true; # Tùy chọn: cải thiện chất lượng

  # --- Webcam Intel IPU6/MIPI (Laptop Intel đời mới) ---
  # hardware.ipu6 = {
  #   enable = true;
  #   platform = "ipu6ep"; # Chọn đúng platform: ipu6, ipu6ep, hoặc ipu6epmtl
  # };

  # =========================================================
  # 3. CÔNG CỤ KIỂM TRA VÀ CẤU HÌNH WEBCAM
  # =========================================================
  environment.systemPackages = with pkgs; [
    v4l-utils    # Cung cấp v4l2-ctl để kiểm tra và tinh chỉnh webcam
    guvcview     # Giao diện đồ họa nhẹ để xem trước và chỉnh thông số webcam
    # cheese     # (Tùy chọn) Ứng dụng chụp ảnh/quay video đơn giản
  ];

  # =========================================================
  # 4. TINH CHỈNH DRIVER UVCVIDEO (CHỈ KHI GẶP LỖI)
  # =========================================================
  # Một số webcam có lỗi kernel-level cần thêm quirk.
  # Ví dụ: webcam bị reset khi bắt đầu stream.
  # boot.extraModprobeConfig = ''
  #   options uvcvideo quirks=0x83
  # '';

  # =========================================================
  # 5. ẨN WEBCAM KHỎI ỨNG DỤNG (TÙY CHỌN)
  # =========================================================
  # Nếu bạn muốn ẩn webcam thật khỏi một số ứng dụng (ví dụ: Chromium),
  # có thể dùng udev rule để thay đổi quyền truy cập.
  # services.udev.extraRules = ''
  #   SUBSYSTEM!="video4linux", GOTO="hide_cam_end"
  #   ACTION!="add", GOTO="hide_cam_end"
  #   KERNEL=="video0", RUN+="${pkgs.coreutils}/bin/chmod 000 /dev/%k"
  #   LABEL="hide_cam_end"
  # '';
}
{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    # 1. BẬT HỖ TRỢ 32-BIT (BẮT BUỘC CHO STEAM)
    # Tùy chọn này tự động cài đặt Mesa, Vulkan và firmware cho kiến trúc 32-bit.
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      vpl-gpu-rt
    ];

    # 2. DRIVER 32-BIT CHO TĂNG TỐC VIDEO
    # Đảm bảo VA-API hoạt động trong môi trường 32-bit của Steam.
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  # 3. TÙY CHỌN: CẢI THIỆN HIỆU NĂNG (Không bắt buộc)
  # Một số game có thể yêu cầu quyền truy cập vào dữ liệu hiệu năng của GPU.
  # Việc bật tùy chọn này giúp loại bỏ cảnh báo và có thể cải thiện hiệu năng đo FPS.
  # Lưu ý: Về mặt lý thuyết, nó có thể mở ra một lỗ hổng bảo mật nhỏ (side-channel attack),
  # nhưng rủi ro trên GPU là rất thấp và hầu hết người dùng đều bật nó.
  boot.kernel.sysctl = {
    "dev.i915.perf_stream_paranoid" = 0;
  };
}
{ pkgs, ... }:

{
  # 1. Kích hoạt Waydroid
  virtualisation.waydroid.enable = true;

  virtualisation.waydroid.package = pkgs.waydroid.override { 
    withNftables = true; 
  };

  # 2. Bắt buộc phải bật thiết lập mạng mạng cho Container
  networking.firewall.allowedUDPPorts = [ 53 67 ];
  networking.firewall.allowedTCPPorts = [ 53 67 ];

  # 3. Tạo alias (phím tắt) để tiện fix lỗi chuột/cảm ứng khi vào Arknights sau này
  environment.shellAliases = {
    waydroid-fix-arknights = "waydroid prop set persist.waydroid.fake_touch com.YoStarEN.Arknights";
  };
}

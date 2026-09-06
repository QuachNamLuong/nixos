{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
  obs-studio
  # Nếu bạn muốn dùng Webcam máy tính làm webcam ảo (Virtual Camera) cho Zoom/Discord:
    v4l-utils
  ];

  # Kích hoạt module nhân cho Webcam ảo nếu cần dùng tính năng Virtual Camera của OBS
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [ "v4l2loopback" ];

}
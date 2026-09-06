{ pkgs, stateVersion, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Ho_Chi_Minh";

  hardware.bluetooth.enable = true;

  # X11 Support
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
  programs.xwayland.enable = true;

  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # State version
  system.stateVersion = stateVersion;

  # Keyboard
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # i18n
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  imports = [
    ./environment.nix
    ./font.nix
    ./keyring.nix
  ];
}

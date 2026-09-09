{ config, pkgs, stateVersion, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    wget
    libsecret
    xwayland-satellite
  ];

  programs.xwayland.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  # Power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  hardware.bluetooth.enable = true;

  # Font
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];	

    fontconfig.defaultFonts = {
      monospace = [ "Jetbrains Mono" ];
    };
  };

 system.stateVersion = stateVersion; 
}

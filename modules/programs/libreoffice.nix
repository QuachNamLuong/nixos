{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    hunspell
    hunspellDicts.en_US
    hyphenDicts.en_US
  ];

  environment.variables = {
    # Buộc LibreOffice dùng bộ dựng hình GTK3 (Hỗ trợ Wayland rất tốt)
    SAL_USE_VCLPLUGIN = "gtk3"; 
  };
}

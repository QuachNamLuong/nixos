{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-lotus ];
  };

  systemd.packages = [ pkgs.fcitx5-lotus ];
  systemd.services."fcitx5-lotus-server@luong" = {
    wantedBy = [ "multi-user.target" ];
    overrideStrategy = "asDropin";
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
}

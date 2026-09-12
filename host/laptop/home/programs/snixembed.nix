systemd.user.services.snixembed = {
  description = "snixembed proxy daemon";
  wantedBy = [ "graphical-session.target" ];
  serviceConfig = {
    ExecStart = "${pkgs.snixembed}/bin/snixembed";
    Restart = "on-failure";
  };
  environment = {
    GDK_BACKEND = "x11";
  };
};
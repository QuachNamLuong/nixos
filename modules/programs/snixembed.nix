{ pkgs, ... }:

{
  # 1. Ensure the package is available to your system/user profile
  environment.systemPackages = [ pkgs.xembed-sni-proxy ];

  # 2. Configure the correct systemd user service
  systemd.user.services.xembedsniproxy = {
    description = "XEmbed to SNI Proxy Daemon for Legacy Tray Icons";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    
    serviceConfig = {
      ExecStart = "${pkgs.xembed-sni-proxy}/bin/xembedsniproxy";
      Restart = "on-failure";
    };
  };
}

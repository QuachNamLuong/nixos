{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # Host cụ thể của bạn
    settings = {
      "home-server" = {
        Hostname = "ssh.quachnamluong.dev";
        ProxyCommand = "${pkgs.cloudflared}/bin/cloudflared access ssh --hostname %h";
        User = "luongadmin";
        Port = 22;
      };
      "github" = {
        Hostname = "github.com";
        User = "git";
        IdentityFile = "/home/luong/.ssh/github";
        IdentitiesOnly = "yes";
      };
    };
  };
}

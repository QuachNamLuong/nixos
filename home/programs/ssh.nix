{ ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "home-server" = {
        hostname = "ssh.quachnamluong.dev";
        user = "luongadmin";
        port = "22";
      }
    };
  };
}
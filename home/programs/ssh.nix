{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    # Các giá trị mặc định bạn muốn giữ lại (khai báo thủ công)
    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "no";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
    };

    # Host cụ thể của bạn
    settings."home-server" = {
      hostname = "ssh.quachnamluong.dev";
      user = "luongadmin";
      port = 22;
    };
  };
}
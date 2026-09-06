{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    
    settings = {
      plugins = {
        auto_update = "all";
        enable = [
          "noctalia/screen_recorder"
          "levi/warp"
        ];

        sources = [
          {
            name = "official";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            enable = true;
          }
          {
            name = "community";
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            enable = true;
          }
        ];
      };
    };
  };
}

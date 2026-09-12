{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    snixembed
  ];
}
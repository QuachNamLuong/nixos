{ ... }:
{
    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;  # cache nhanh hơn, khuyến nghị đi kèm
        };
}
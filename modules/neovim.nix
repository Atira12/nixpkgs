{
  config,
  pkgs,
  libs,
  ...
}:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/home-manager";
in
{
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; []
}

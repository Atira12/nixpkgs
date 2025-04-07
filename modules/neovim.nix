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
    version = "0.10.4";
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; []
}

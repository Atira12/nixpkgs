{
  config,
  pkgs,
  libs,
  ...
}:
let
  lazyConfig = "${config.home.homeDirectory}";
in
{
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${lazyConfig}";
}

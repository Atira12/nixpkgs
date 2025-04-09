{
  config,
  ...
}:
let
  lazyConfig = "${config.home.homeDirectory}/lazynvim";
in
{
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${lazyConfig}";
}

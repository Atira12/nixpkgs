{ config, ... }:
let
  lazyConfig = builtins.fetchGit {
    url = "https://github.com/Atira12/lazynvim";
    rev = "0d3f200300e08f3b217d0ef097ce351879d75b15";
  };
in {
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
  };
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${lazyConfig}";
}

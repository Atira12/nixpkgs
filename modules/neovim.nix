{ config, ... }:
let
  lazyConfig = builtins.fetchGit {
    url = "https://github.com/Atira12/lazynvim";
    rev = "2e01a5b99dce6444b1ebeb7be3032c44b6091fde";
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

{ config, ... }:
let
  lazyConfig = builtins.fetchGit {
    url = "https://github.com/Atira12/lazynvim";
    rev = "ceee28c79598e7701ef35f37012aa0aa518bafa9";
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

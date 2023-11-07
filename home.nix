{ config, pkgs, nur, ... }: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    powerline-go.enable = true;
    bash = {
      enable = true;
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
    git = {
      enable = true;
      package = pkgs.gitFull;
      userEmail = "stefan.bordei@softwareone.com";
      userName = "stefan.bordei";
      extraConfig = {
        core.editor = "vim";
      };
    };

    #  other programs
    bat.enable = true;
    eza.enable = true;
    fzf.enable = true;
    gh.enable = true;
    gitui.enable = true;
    lazygit.enable = true;
    neovim.enable = true;
    go.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TCLLIBPATH = "$HOME/.local/share/tk-themes";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  services = {
    gnome-keyring.enable = true;
    picom.enable= true;
  };

  xdg.enable = true;
}

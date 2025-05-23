{ pkgs, config, ... }:

let homeManagerConfig = "${config.home.homeDirectory}/.config/home-manager";
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wamu";
  home.homeDirectory = "/home/wamu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = { EDITOR = "nvim"; };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aoantov/etc/profile.d/hm-session-vars.sh
  #
  home.shell.enableZshIntegration = true;

  programs = {
    git = {
      enable = true;
      package = pkgs.gitFull;
      userEmail = "anton.antov@softwareone.com";
      userName = "aoantov";
      extraConfig = { core.editor = "vim"; };
    };

    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = { enable = true; };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "docker" "docker-compose" ];
        extraConfig = ''
          source ${homeManagerConfig}/configs/zsh/theme.zsh
          source ${config.home.homeDirectory}/custom.zsh     
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme 
        '';
      };
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # Let Home Manager install and manage itself.

}

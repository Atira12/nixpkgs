{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Utilities
    (python3.withPackages (p: with p; [ pip ]))
    pyenv
    gcc
    wget
    curl

    # AWS
    awscli2
    awsume

    # JS
    volta

    # General
    jira-cli-go
    microsoft-edge
    firefox
    teams
    ripgrep

    # Fonts
    nerd-fonts.jetbrains-mono

    # Rust
    cargo

    # K8S
    kubectl
    docker
    docker-compose

    # Java
    gradle
    # jetbrains.idea-ultimate

    # Terraform
    tfswitch

    # Other
    zsh-powerlevel10k

  ];
}

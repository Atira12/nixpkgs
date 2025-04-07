{
  config,
  pkgs,
  libs,
  ...
}:
let
in
{
  home.packages = with pkgs; [
    # Utilities
    (python3.withPackages (
      p: with p; [
        pip
      ]
    ))
    pyenv
    gcc
    wget
    curl

    # AWS
    awscli2
    awsume

    # General
    fzf
    jira-cli-go
    microsoft-edge
    firefox
    teams
    ripgrep

    # Fonts
    nerd-fonts.jetbrains-mono

    # K8S
    kubectl

    # Terraform
    tfswitch
  ];
}

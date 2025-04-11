{ config, ... }: {
  programs.firefox.profiles.wamu = { extensions.packages = [ ]; };
}

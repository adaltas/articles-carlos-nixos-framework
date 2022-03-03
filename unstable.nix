{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  environment.systemPackages = with pkgs; [
    unstable.gitkraken
    unstable.jetbrains.pycharm-professional
    unstable.jetbrains.webstorm
    unstable.jetbrains.datagrip
    unstable.jetbrains.idea-ultimate
    unstable.docker
    unstable.firefox
    #unstable.rWrapper
  ];
}

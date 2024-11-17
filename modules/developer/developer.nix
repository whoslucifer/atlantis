{
  config,
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    clang
    go
    gcc

    openjdk17-bootstrap

    github-desktop

    android-tools
    vscode
    android-studio
    android-studio-tools
    gradle

    nodejs
    yarn

    jetbrains.idea-community-bin
    netbeans

    php

    jetbrains.pycharm-community-bin

    arduino
    arduino-ide

    waydroid
  ];
}

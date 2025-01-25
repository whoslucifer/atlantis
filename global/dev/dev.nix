{
  config,
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    clang
    cmake
    go
    gcc

    lazygit

    openjdk23
    uv
    ruby

    android-tools
    android-studio
    android-studio-tools
    gradle

    rustc

    nodejs
    yarn
    csslint

    #waydroid
  ];
}

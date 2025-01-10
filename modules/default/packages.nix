{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gnumake
    xwayland
    blender
    google-chrome
    teams-for-linux
    localsend

    #for ags new
    cloudflare-warp
    cloudflared
    pinokio #installs ai tools locally
  ];
}

{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gparted

    wezterm
    blender
    google-chrome
    teams-for-linux
    localsend

    #for ags new
    cloudflare-warp
    cloudflared
    #nerdfonts
    pinokio #installs ai tools locally
  ];
}

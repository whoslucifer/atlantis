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
    #plasma5Packages.kdeconnect-kde
    kdePackages.kdeconnect-kde

    #for ags new
    cloudflare-warp
    cloudflared
    #nerdfonts
    pinokio #installs ai tools locally
  ];
}

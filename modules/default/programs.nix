{
  config,
  pkgs,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: {
  # for ags
  fonts.packages = with pkgs; [
    material-symbols
    material-icons
    lexend
    nerdfonts
  ]; 


  programs = {
    hyprlock.enable = true;
    nm-applet.indicator = true;

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

    virt-manager.enable = false;

    #steam = {
    #  enable = true;
    #  gamescopeSession.enable = true;
    #  remotePlay.openFirewall = true;
    #  dedicatedServer.openFirewall = true;
    #};

    xwayland.enable = true;
    
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
 
  #for ags
  environment.systemPackages = with pkgs; [

    torctl
    tor
    iptables
    gparted


  ];


  
  /*services.tor = {
    enable = true;
    client.enable = true;
    openFirewall = true;
    client.dns.enable = true;
    torsocks.enable = true;
    relay = {
      enable = false;
      role = "relay";
    };
    settings = {
      ContactInfo = "lucifer@proton.me";
      Nickname = "femboy02";
      ORPort = 9001;
      ControlPort = 9051;
      BandWidthRate = "1 MBytes";
    };
  };*/

}

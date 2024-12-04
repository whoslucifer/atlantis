{...}: {
  imports = [
    ./system/boot.nix
    ./system/boot-loader.nix
    ./system/sddm-deps.nix
    #./system/laptop.nix
    ./system/locales.nix
    ./system/networking.nix
    ./system/hotspot.nix

    ./system/intel-drivers.nix
    ./system/vm-guest-services.nix
    ./system/local-hardware-clock.nix

    ./desktop/gnome.nix

    #./custom/burpsuitepro.nix

    ./default/programs.nix
    ./default/packages.nix
    ./default/tor.nix
    ./default/virtualization.nix
    ./default/extra.nix
    ./default/sound.nix
    ./default/spotify.nix
    ./default/zen-browser.nix
    ./default/services.nix
    ./default/security.nix
    ./default/insecure.nix
    ./default/utils.nix
    ./default/thunar.nix
    ./default/zram.nix

    ./stable/default.nix

    ./developer/developer.nix
    ./developer/mysql.nix
    ./developer/postgresql.nix

    ./pentester/default.nix
  ];
}

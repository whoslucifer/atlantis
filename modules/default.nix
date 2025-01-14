{...}: {
  imports = [
    ./system/boot/boot-loader.nix
    ./system/boot/boot.nix
    ./desktop/displayManager/sddm.nix
    ./system/locales.nix
    ./system/networking/networking.nix
    ./system/networking/hotspot.nix

    ./system/hardware/intel-drivers.nix
    ./system/hardware/laptop.nix
    ./system/hardware/local-hardware-clock.nix
    ./system/hardware/vm-guest-services.nix

    ./desktop/sessions.nix

    #./custom/burpsuitepro/burp.nix

    ./desktop/ags.nix
    ./desktop/theme.nix

    ./developer/neovim.nix
    ./default/packages.nix
    ./system/networking/tor.nix
    ./virtualization/virtualization.nix
    ./desktop/extra.nix
    ./desktop/sound.nix
    ./default/spotify.nix
    ./default/zen-browser.nix
    ./default/services.nix
    ./system/security.nix
    ./default/insecure.nix
    ./default/utils.nix
    ./desktop/thunar.nix
    ./system/zram.nix

    ./stable/default.nix

    ./default/nix-ld.nix
    ./developer/developer.nix
    ./developer/mysql.nix
    ./developer/postgresql.nix

    #./pentester/default.nix
  ];
}

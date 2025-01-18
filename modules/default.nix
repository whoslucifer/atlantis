{...}: {
  imports = [
    ./default/packages.nix
    ./default/nix-ld.nix
    ./default/spotify.nix
    ./default/zen-browser.nix
    ./default/services.nix
    ./default/insecure.nix
    ./default/broken.nix
    ./default/utils.nix

    ./stable/default.nix
    # ./custom/burpsuitepro/loader.nix
    # ./custom/burpsuitepro/burp.nix

    ./system/boot/boot-loader.nix
    ./system/boot/boot.nix
    ./system/locales.nix
    ./system/networking/networking.nix
    ./system/networking/hotspot.nix

    ./system/hardware/intel-drivers.nix
    ./system/hardware/laptop.nix
    ./system/hardware/local-hardware-clock.nix
    ./system/hardware/vm-guest-services.nix

    ./system/networking/tor.nix

    ./system/zram.nix
    ./system/security.nix

    ./desktop/sessions.nix
    ./desktop/ags.nix
    ./desktop/theme.nix
    ./desktop/nushell.nix
    ./desktop/extra.nix
    ./desktop/sound.nix
    ./desktop/thunar.nix

    ./desktop/displayManager/sddm.nix

    ./virtualization/virtualization.nix

    ./developer/default.nix

    ./pentester/default.nix
  ];
}

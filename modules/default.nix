{ ... }:
{
  imports = [
    #./system/misc/intel-drivers.nix
    #./system/gpu.nix
    #./system/default.nix
    #./system/cpu.nix
    #./system/misc/amd-drivers.nix
    #./system/misc/nvidia-drivers.nix
    #./system/misc/nvidia-prime-drivers.nix
    ./system/misc/vm-guest-services.nix
    ./system/misc/local-hardware-clock.nix

    ./system/locales.nix
    ./system/networking.nix
    ./system/hotspot.nix
    ./system/boot.nix
    ./system/boot-loader.nix
    #./system/laptop.nix

    ./programs.nix
    ./virtualization.nix
    ./extra.nix
    ./sound.nix
    ./spotify.nix
    ./zen-browser.nix
    #./thorium.nix
    ./services.nix
    ./security.nix
    ./insecure.nix
    ./stable/default.nix

    ./developer/developer.nix
    ./developer/mysql.nix
    ./developer/postgresql.nix

    ./pentester/default.nix

    ./utils.nix

  ];
}

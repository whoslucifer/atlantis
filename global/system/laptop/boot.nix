{
  pkgs,
  system,
  inputs,
  config,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Kernel

    # This is for OBS Virtual Cam Support
    kernelModules = ["v4l2loopback" "i2c-dev"];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];

    supportedFilesystems = ["ntfs"];

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "boot.shell_on_fail"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = ["i915"];
    };

    # Make /tmp a tmpfs
    tmp = {
      useTmpfs = false;
      tmpfsSize = "30%";
    };

    loader = {
      # systemd-boot.enable = false;
      timeout = 60;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        devices = ["nodev"];
        enable = true;
        efiSupport = true;
        useOSProber = true;
        theme = lib.mkForce inputs.distro-grub-themes.packages.${system}.thinkpad-grub-theme;
      };
    };
  };
}

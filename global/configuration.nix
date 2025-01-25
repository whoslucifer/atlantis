{
  pkgs,
  username,
  systemConfig,
  userConfig,
  ...
}: {
  # nixpkgs.config.allowUnfree = true;

  imports = [
    (import ./system/laptop/locale.nix {inherit systemConfig;})
    ./default.nix
  ];

  # Virtual Machine
  # vm.enable = false;

  # Services
  #syncthing.enable = true;
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = systemConfig.hostname;

  # To support mtp/android file transfer
  services.ipp-usb.enable = true;
  services.gvfs.enable = true;

  #power
  services.upower.enable = true;

  # nix-ld: run unpatched dynamic binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [stdenv.cc.cc.lib];
  };

  # Enable .appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Current Shell
  programs.fish.enable = true;

  users = {
    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
        "docker"
        "wireshark"
        "dialout"
        "fingerprint"
        "plugdev"
      ];
    };

    # create groups that arent created
    groups = {
      scanner = {};
      libvirtd = {};
      wireshark = {};
      dialout = {};
      fingerprint = {};
      plugdev = {};
    };

    defaultUserShell = pkgs.nushell;
  };

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    EDITOR = "nvim";
  };

  # Enable SSD Trim
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  # GNU Privacy Guard
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # NixOS Version
  # -------------
  system.stateVersion = "24.11";
}

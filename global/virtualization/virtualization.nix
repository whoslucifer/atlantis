{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    libvirtd.enable = true;
    lxd.enable = true;

    podman = {
      enable = false;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = false;
    };

    waydroid = {
      enable = true;
    };

    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
  };
  environment.systemPackages = with pkgs; [
    bottles
    wine
    vulkan-tools
  ];
}

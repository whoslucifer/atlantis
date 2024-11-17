{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    libvirtd.enable = false;
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
    };
  };

  environment.systemPackages = with pkgs; [
    bottles
    wine
    vulkan-tools
    genymotion
  ];
}

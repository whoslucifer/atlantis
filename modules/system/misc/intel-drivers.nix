{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.drivers.intel;
in
{
  options.drivers.intel = {
    enable = mkEnableOption "Enable Intel Graphics Drivers";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "intel" ];
    nixpkgs.config.packageOverrides = pkgs: {
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
    };

    # OpenGL
    hardware.graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        mesa
        vpl-gpu-rt
        clinfo
        ocl-icd
        intel-compute-runtime
        libvdpau-va-gl
        libva
			  libva-utils
      ];
    };
  };
}

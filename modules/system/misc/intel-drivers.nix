{ pkgs, ... }:
{
    # OpenGL
    hardware.graphics = {
      enable = true;

      extraPackages = with pkgs; [
        intel-media-driver
        intel-media-sdk
        #intel-compute-runtime
        #ocl-icd
        #clinfo
        mesa 
        intel-vaapi-driver
        libvdpau-va-gl
        libva
        libva-vdpau-driver
      ];
    };
    environment.systemPackages = with pkgs; [
      mesa
      intel-vaapi-driver
    ];
}

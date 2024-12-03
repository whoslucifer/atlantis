{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.permittedInsecurePackages = [
    "qbittorrent-4.6.4"
    "googleearth-pro-7.3.6.9796"
    "python3.12-youtube-dl-2021.12.17"
  ];

  environment.systemPackages = with pkgs; [
    qbittorrent # Potential Remote Code Execution https://www.openwall.com/lists/oss-security/2024/10/30/4
    googleearth-pro # Includes vulnerable versions of bundled libraries: openssl, ffmpeg, gdal, and proj.
    headlines
  ];
}

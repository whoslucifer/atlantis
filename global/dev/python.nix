{pkgs, ...}: let
  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        tqdm # needed by davyciphers jackscanner
        pillow
        materialyoucolor
        material-color-utilities
        setproctitle
        debugpy # python debug adapter for nvim-dap
      ]
  );
in {
  environment.systemPackages = [
    python-packages
  ];
}

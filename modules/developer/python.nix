{
  pkgs,
  ...
}:
let
  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        tqdm # needed by davyciphers jackscanner
        pillow
        materialyoucolor
        setproctitle
        
      ]
  );

in  
{
  environment.systemPackages = [
    python-packages

  ];
}

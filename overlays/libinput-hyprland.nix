final: prev: {
  libinput = prev.libinput.overrideAttrs (oldAttrs: {
    version = "1.26.0";
    src = prev.fetchurl {
      url = "https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.26.0/libinput-1.26.0.tar.gz";
      sha256 = "12xxh02zj87l263gg1w7jsiaps3f6b1h347j20p46h87svk49adx";
    };
  });
}


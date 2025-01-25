const home = `/home/${Utils.exec("whoami")}`;

export const options = {
  terminal: "kitty",
  quicksettings: {
    profile_picture: `${home}/Downloads/waifu.png`,
    screenshot: {
      path: `${home}/Pictures/screenshots`,
    },
    random_wall: {
      path: `${home}/Pictures/wallpapers`,
    },
  },
  mpris: {
    fallback_img: "https://ik.imagekit.io/rayshold/gallery/mpris-fallback.webp",
  },
  wallpaper_picker: {
    path: `${home}/.config/swww/compressed-walls`,
  },
};

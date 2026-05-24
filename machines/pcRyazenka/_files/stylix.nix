{
  pkgs,
  lib,
  config,
  ...
}:

{
  stylix = {
    polarity = "dark";

    base16Scheme = lib.mkStylix.theme "paradise";

    image = lib.mkStylix.image (pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/og/wallhaven-ogl5z9.png";
      sha256 = "sha256-VvnBCulYtyVqJOQ5psLJyIvK8YffWPP8Stz9KgznGcY=";
    }) config.lib.stylix.colors.toList;
  };
}

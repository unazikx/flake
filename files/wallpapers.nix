{
  zen,
  lib,
  ...
}:

{
  zen.flake-parts.default = {
    includes = [
      zen.custom.wallpapers
    ];

    wallpapers =
      {
        ...
      }:
      {
        # keep-sorted start block=yes newline_separated=yes
        "Alike Windows XP" = {
          url = "https://wallhaven.cc/w/9og561";
          extension = "jpg";
        };

        "Assasins Creed: Black Flag Sea" = {
          url = "https://wallhaven.cc/w/6lyop6";
          extension = "jpg";
        };

        "Blender SU~SHI" = {
          url = "https://wallhaven.cc/w/yq2m77";
          extension = "png";
        };

        "Fast Food" = {
          url = "https://wallhaven.cc/w/lydqy2";
          extension = "png";
        };

        "GTA VI: Palmsbeach" = {
          url = "https://wallhaven.cc/w/d8o6wg";
          extension = "jpg";
        };

        "Gavryl fog" = {
          url = "https://wallhaven.cc/w/w5x65p";
          extension = "jpg";
        };

        "Gavryl snowday" = {
          url = "https://wallhaven.cc/w/z88dww";
          extension = "jpg";
        };

        "Gavryl sundown" = {
          url = "https://wallhaven.cc/w/rq6yqm";
          extension = "jpg";
        };

        "Gavryl sunrise" = {
          url = "https://wallhaven.cc/w/575r67";
          extension = "jpg";
        };

        "Jax TADC" = {
          url = "https://wallhaven.cc/w/mlgomm";
          extension = "png";
        };

        "Lipsgarets" = {
          url = "https://wallhaven.cc/w/po7ove";
          extension = "jpg";
        };

        "Minecraft Amethyst" = {
          url = "https://wallhaven.cc/w/l8qq3l";
          extension = "png";
        };

        "Minecraft Birch" = {
          url = "https://wallhaven.cc/w/e7651w";
          extension = "jpg";
        };

        "Minecraft Moon Derpy" = {
          url = "https://wallhaven.cc/w/l36362";
          extension = "png";
        };

        "Oceanview" = {
          url = "https://wallhaven.cc/w/w5d657";
          extension = "png";
        };

        "Puyo Puyo" = {
          url = "https://wallhaven.cc/w/qrmell";
          extension = "png";
        };

        "Pyramidas" = {
          url = "https://wallhaven.cc/w/jed11w";
          extension = "png";
        };

        "Sakura Train" = {
          url = "https://wallhaven.cc/w/yqg6r7";
          extension = "jpg";
        };

        "Sayonara Lara" = {
          url = "https://wallhaven.cc/w/jeyy15";
          extension = "png";
        };

        "Silhouette" = {
          url = "https://wallhaven.cc/w/e86xlo";
          extension = "png";
        };

        "Skullus" = {
          url = "https://wallhaven.cc/w/ogj11l";
          extension = "png";
        };

        "Stanley Parable" = {
          url = "https://wallhaven.cc/w/9o9w3x";
          extension = "jpg";
        };
        # keep-sorted end
      };

    files =
      {
        config,
        ...
      }:
      let
        processWallpaper =
          _name: wallpaper:
          let
            url = wallpaper.url;
            id = lib.head (lib.match ".*/w/(.*)" url);
            sub = lib.substring 0 2 id;
            ext = wallpaper.extension;
          in
          {
            page = url;
            full = "https://w.wallhaven.cc/full/${sub}/wallhaven-${id}.${ext}";
            small = "https://th.wallhaven.cc/small/${sub}/${id}.jpg";
          };
      in
      {
        file."wallpapers.md" =
          let
            tags = {
              "Stray" = "https://wallhaven.cc/tag/134796";
              "GTA: VI" = "https://wallhaven.cc/tag/149658";
            };

            list = lib.mapAttrs processWallpaper config.wallpapers;

            formatEntry = name: entry: ''
              [__${name}__](${entry.page}) -> (_${entry.full}_)

              ![${name}](${entry.small})
            '';

            formatTag = name: url: ''
              __${name}__ -> (${url})
            '';
          in
          {
            text = ''
              # Wallpapers

              !!! DONT BLAME ME IF PNG OR JPG NOT WORKING

              ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatEntry list)}

              ## Tags

              ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatTag tags)}

              ## Total: ${toString (lib.length (lib.attrNames list))} wallpapers from https://wallhaven.cc
            '';
          };
      };
  };
}

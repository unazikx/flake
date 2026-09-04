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
      let
        listOfWallpapers = {
          # keep-sorted start block=yes newline_separated=yes
          "Alike Windows XP" = {
            page = "https://wallhaven.cc/w/9og561";
            hash = "sha256-Q9PsKDslsS8vvCGf1o//Ls/hD85wctPoi//uAVP0WLc=";
            extension = "jpg";
          };

          "Assasins Creed: Black Flag Sea" = {
            page = "https://wallhaven.cc/w/6lyop6";
            hash = "sha256-20iKJrblZuFBIf8mXDK6Q6c516uqOrVFIjJ21gi9DH4=";
            extension = "jpg";
          };

          "Blender SU~SHI" = {
            page = "https://wallhaven.cc/w/yq2m77";
            hash = "sha256-ITLcz6W40IcRoLobCK4RhyEq+026Mk3/y7cwQWexrWY=";
            extension = "png";
          };

          "Dredger" = {
            page = "https://wallhaven.cc/w/6lyv5x";
            hash = "sha256-Odpiu2RrlXBZkDeKtU4X0UKP9cW9RuPGZbaxhUdkJL4=";
            extension = "png";
          };

          "Fast Food" = {
            page = "https://wallhaven.cc/w/lydqy2";
            hash = "sha256-ZamFBSQZpnLo6zhlcNH7nmjcrMufrYMkElFWZ1oWnLg=";
            extension = "png";
          };

          "Gavryl fog" = {
            page = "https://wallhaven.cc/w/w5x65p";
            hash = "sha256-aUTvlXBCEwi6gPmosh4vgTzbcr3YyJllFm0E5lLW5ks=";
            extension = "jpg";
          };

          "Gavryl snowday" = {
            page = "https://wallhaven.cc/w/z88dww";
            hash = "sha256-mxQCilQ+NRB2RE2PxIANHWZy17aVe8WoRIcM/DqEjSg=";
            extension = "jpg";
          };

          "Gavryl sundown" = {
            page = "https://wallhaven.cc/w/rq6yqm";
            hash = "sha256-zgHMKLb0ZKs9dxftb/KR2LP2+YjrWO4rLl1KoMAYofA=";
            extension = "jpg";
          };

          "Gavryl sunrise" = {
            page = "https://wallhaven.cc/w/575r67";
            hash = "sha256-uAdRbZgeKfSzZftqcIphjtwsm0r2LN4RzoE3rtM4RIA=";
            extension = "jpg";
          };

          "Lani Cafe" = {
            page = "https://wallhaven.cc/w/ogjjx9";
            hash = "sha256-OuQ4ZBHXSe4Ql2tbvlFOBjSXy4kQMKgkyMBj/sTVg/0=";
            extension = "jpg";
          };

          "Lipsgarets" = {
            page = "https://wallhaven.cc/w/po7ove";
            hash = "sha256-o2jAvGSXVikvAY14t8bjg/8yfFac7kXJXRU3UK5zNEI=";
            extension = "jpg";
          };

          "Minecraft Amethyst" = {
            page = "https://wallhaven.cc/w/l8qq3l";
            hash = "sha256-M6bRjpDNR3TClnEyd4WlQtuONkB0JHFZ2x7t3MLRhFE=";
            extension = "png";
          };

          "Minecraft Moon Derpy" = {
            page = "https://wallhaven.cc/w/l36362";
            hash = "sha256-6ODl/fcSlGelTOj8uZgIceALFZzk/7vMS7A5CrYqqC0=";
            extension = "png";
          };

          "Pepe XP" = {
            page = "https://wallhaven.cc/w/ogl5z9";
            hash = "sha256-VvnBCulYtyVqJOQ5psLJyIvK8YffWPP8Stz9KgznGcY=";
            extension = "png";
          };

          "Puyo Puyo" = {
            page = "https://wallhaven.cc/w/qrmell";
            hash = "sha256-hz1OTPfSxwskaNWo3t0JpU0MlG9BFyZht79x19OLBeI=";
            extension = "png";
          };

          "Sakura Train" = {
            page = "https://wallhaven.cc/w/yqg6r7";
            hash = "sha256-RI/KERuKYPLcIpjawRsElocoOtEcZy6UR/D4dqoLqSg=";
            extension = "jpg";
          };

          "Silhouette" = {
            page = "https://wallhaven.cc/w/e86xlo";
            hash = "sha256-CaQLKhOLBoNd3AK4hysHVDSS8hb8o42F12tkeBBEJ7g=";
            extension = "png";
          };

          "Stanley Parable" = {
            page = "https://wallhaven.cc/w/9o9w3x";
            hash = "sha256-Eubcop/4RvK89YhAemw9qQa47SrUoGR2sLob04sD00Y=";
            extension = "jpg";
          };
          # keep-sorted end
        };

        process =
          {
            page,
            hash,
            extension,
          }:
          let
            id = lib.head (lib.match ".*/w/(.*)" page);
            sub = lib.substring 0 2 id;
          in
          {
            inherit page hash extension;
            full = "https://w.wallhaven.cc/full/${sub}/wallhaven-${id}.${extension}";
            small = "https://th.wallhaven.cc/small/${sub}/${id}.jpg";
          };
      in
      builtins.mapAttrs (_name: value: process value) listOfWallpapers;

    files =
      {
        config,
        ...
      }:
      {
        file."wallpapers.md" =
          let
            tags = {
              "Stray" = "https://wallhaven.cc/tag/134796";
              "GTA: VI" = "https://wallhaven.cc/tag/149658";
            };

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

              ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatEntry config.wallpapers)}

              ## Tags

              ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatTag tags)}

              ## Total: ${toString (lib.length (lib.attrNames config.wallpapers))} wallpapers from https://wallhaven.cc
            '';
          };
      };

    legacyPackages =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        sanitize =
          name:
          lib.toLower (
            builtins.replaceStrings
              [
                " "
                ":"
                "~"
              ]
              [
                "-"
                ""
                "-"
              ]
              name
          );

        mkWallpapers =
          {
            colors ? [
              "151515"
              "1f1f1f"
              "d9bc8c"
              "8da3b9"
            ],
          }:
          let
            colorsStr = builtins.concatStringsSep " " colors;

            processOne =
              name:
              {
                full,
                hash,
                extension,
                ...
              }:
              let
                fileName = sanitize "${name}.${extension}";
                image = builtins.fetchurl {
                  name = fileName;
                  url = full;
                  sha256 = hash;
                };
              in
              pkgs.runCommandLocal "lutgen-${fileName}"
                {
                  buildInputs = [ pkgs.lutgen ];
                  inherit image colorsStr extension;
                }
                ''
                  lutgen apply "$image" -o "$out" -- $colorsStr
                '';

            processed = lib.mapAttrs processOne config.wallpapers;
          in
          (
            (lib.mapAttrs' (
              name: drv:
              let
                fileName = sanitize name;
                extension = config.wallpapers.${name}.extension;
                fullName = "${fileName}.${extension}";
              in
              lib.nameValuePair fileName (
                pkgs.runCommandLocal fullName { } ''
                  ln -s ${drv} $out
                ''
              )
            ) processed)
            // {
              _farmed = pkgs.linkFarm "images-farmed" (
                lib.mapAttrsToList (name: drv: {
                  name = "${sanitize name}.${config.wallpapers.${name}.extension}";
                  path = drv;
                }) processed
              );
            }
          );
      in
      {
        images = lib.makeOverridable mkWallpapers { };
      };
  };
}

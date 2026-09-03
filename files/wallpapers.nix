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
          # "Fast Food" = {
          #   page = "https://wallhaven.cc/w/lydqy2";
          #   extension = "png";
          # };

          # "GTA VI: Palmsbeach" = {
          #   page = "https://wallhaven.cc/w/d8o6wg";
          #   extension = "jpg";
          # };

          # "Jax TADC" = {
          #   page = "https://wallhaven.cc/w/mlgomm";
          #   extension = "png";
          # };

          # "Lipsgarets" = {
          #   page = "https://wallhaven.cc/w/po7ove";
          #   extension = "jpg";
          # };

          # "Minecraft Amethyst" = {
          #   page = "https://wallhaven.cc/w/l8qq3l";
          #   extension = "png";
          # };

          # "Minecraft Birch" = {
          #   page = "https://wallhaven.cc/w/e7651w";
          #   extension = "jpg";
          # };

          # "Minecraft Moon Derpy" = {
          #   page = "https://wallhaven.cc/w/l36362";
          #   extension = "png";
          # };

          # "Oceanview" = {
          #   page = "https://wallhaven.cc/w/w5d657";
          #   extension = "png";
          # };

          # "Puyo Puyo" = {
          #   page = "https://wallhaven.cc/w/qrmell";
          #   extension = "png";
          # };

          # "Pyramidas" = {
          #   page = "https://wallhaven.cc/w/jed11w";
          #   extension = "png";
          # };

          # "Sayonara Lara" = {
          #   page = "https://wallhaven.cc/w/jeyy15";
          #   extension = "png";
          # };

          # "Silhouette" = {
          #   page = "https://wallhaven.cc/w/e86xlo";
          #   extension = "png";
          # };

          # "Skullus" = {
          #   page = "https://wallhaven.cc/w/ogj11l";
          #   extension = "png";
          # };

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

          "Sakura Train" = {
            page = "https://wallhaven.cc/w/yqg6r7";
            hash = "sha256-RI/KERuKYPLcIpjawRsElocoOtEcZy6UR/D4dqoLqSg=";
            extension = "jpg";
          };

          # "Stanley Parable" = {
          #   page = "https://wallhaven.cc/w/9o9w3x";
          #   extension = "jpg";
          # };
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

              !!! DONT BLAME ME IF PNG OR JPG NOT WORKING

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
                  buildInputs = [
                    pkgs.lutgen
                    pkgs.jpegoptim
                    pkgs.pngloss
                  ];

                  inherit image colorsStr extension;
                }
                ''
                  tmp=$(mktemp --suffix=".$extension")
                  cp "$image" "$tmp"

                  case "$extension" in
                    png)
                      pngloss -o "$tmp.loss" -- "$tmp"
                      mv "$tmp.loss" "$tmp"
                      ;;
                    jpg)
                      jpegoptim -s -q --strip-all --max=85 "$tmp"
                      ;;
                  esac

                  lutgen apply "$tmp" -o "$out" -- $colorsStr
                  rm -f "$tmp"
                '';

            processed = lib.mapAttrs processOne config.wallpapers;
          in
          (
            (lib.mapAttrs' (
              name: drv:
              let
                fileName = sanitize name;
              in
              lib.nameValuePair fileName (
                pkgs.linkFarm fileName [
                  {
                    name = fileName;
                    path = drv;
                  }
                ]
              )
            ) processed)
            // {
              images-farmed = pkgs.linkFarm "images-farmed" (
                lib.mapAttrsToList (name: drv: {
                  name = sanitize name;
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

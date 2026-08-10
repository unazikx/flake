{
  lib,
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        ...
      }:
      {
        file."wallpapers.md" =
          let
            wallpapers = {
              # keep-sorted start
              "Alike Windows XP" = "https://wallhaven.cc/w/9og561";
              "Assasins Creed: Black Flag Sea" = "https://wallhaven.cc/w/6lyop6";
              "Blender SU~SHI" = "https://wallhaven.cc/w/yq2m77";
              "Fast Food" = "https://wallhaven.cc/w/lydqy2";
              "GTA VI: Palmsbeach" = "https://wallhaven.cc/w/d8o6wg";
              "Gavryl fog" = "https://wallhaven.cc/w/w5x65p";
              "Gavryl snowday" = "https://wallhaven.cc/w/z88dww";
              "Gavryl sundown" = "https://wallhaven.cc/w/rq6yqm";
              "Gavryl sunrise" = "https://wallhaven.cc/w/575r67";
              "Jax TADC" = "https://wallhaven.cc/w/mlgomm";
              "Lipsgarets" = "https://wallhaven.cc/w/po7ove";
              "Oceanview" = "https://wallhaven.cc/w/w5d657";
              "Puyo Puyo" = "https://wallhaven.cc/w/qrmell";
              "Pyramidas" = "https://wallhaven.cc/w/jed11w";
              "Sayonara Lara" = "https://wallhaven.cc/w/jeyy15";
              "Silhouette" = "https://wallhaven.cc/w/e86xlo";
              "Skullus" = "https://wallhaven.cc/w/ogj11l";
              "Stanley Parable" = "https://wallhaven.cc/w/9o9w3x";
              # keep-sorted end
            };

            tags = {
              "Stray" = "https://wallhaven.cc/tag/134796";
              "GTA: VI" = "https://wallhaven.cc/tag/149658";
            };

            toEntry =
              _name: url:
              let
                id = lib.head (lib.match ".*/w/(.*)" url);
                sub = lib.substring 0 2 id;
              in
              {
                page = url;
                original = "https://w.wallhaven.cc/full/${sub}/wallhaven-${id}.png";
                small = "https://th.wallhaven.cc/small/${sub}/${id}.jpg";
              };

            formatEntry = name: entry: ''
              __${name}__ -> (${entry.page} - ${entry.original})

              ![${name}](${entry.small})
            '';

            formatTag = name: url: ''
              __${name}__ -> (${url})
            '';

            list = lib.mapAttrs toEntry wallpapers;
          in
          {
            text = ''
              ## Wallpapers

              ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatEntry list)}

              ## Tags

              ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatTag tags)}

              ## Total: ${toString (lib.length (lib.attrNames list))} wallpapers from https://wallhaven.cc
            '';
          };
      };
  };
}

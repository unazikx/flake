{
  lib,
  ...
}:

let
  wallpapers = {
    # keep-sorted start
    "Alike Windows XP" = "https://wallhaven.cc/w/9og561";
    "Assasins Creed: Black Flag Sea" = "https://wallhaven.cc/w/6lyop6";
    "Blender SU~SHI" = "https://wallhaven.cc/w/yq2m77";
    "Fast Food" = "https://wallhaven.cc/w/lydqy2";
    "GTA VI: Palmsbeach" = "https://wallhaven.cc/w/d8o6wg";
    "Jax TADC" = "https://wallhaven.cc/w/mlgomm";
    "Lipsgarets" = "https://wallhaven.cc/w/po7ove";
    "Oceanview" = "https://wallhaven.cc/w/w5d657";
    "Puyo Puyo" = "https://wallhaven.cc/w/qrmell";
    "Sayonara Lara" = "https://wallhaven.cc/w/jeyy15";
    "Silhouette" = "https://wallhaven.cc/w/e86xlo";
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
  perSystem =
    {
      ...
    }:
    {
      files.file."wallpapers.md" = {
        text = ''
          ## Wallpapers

          ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatEntry list)}

          ## Tags

          ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatTag tags)}

          ## Total: ${toString (lib.length (lib.attrNames list))} wallpapers from https://wallhaven.cc
        '';
      };
    };
}

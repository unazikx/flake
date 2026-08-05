{
  lib,
  ...
}:

let
  wallpapers = {
    # keep-sorted start
    "Alike Windows XP" = "https://wallhaven.cc/w/9og561";
    "Assasins Creed: Black Flag - Sea" = "https://wallhaven.cc/w/6lyop6";
    "Fast Food" = "https://wallhaven.cc/w/lydqy2";
    "Jax TADC" = "https://wallhaven.cc/w/mlgomm";
    "Puyo Puyo" = "https://wallhaven.cc/w/qrmell";
    "Stanley Parable" = "https://wallhaven.cc/w/9o9w3x";
    # keep-sorted end
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
          # Wallpapers generated from https://wallhaven.cc

          ${lib.concatStringsSep "\n\n" (lib.mapAttrsToList formatEntry list)}

          Total: ${toString (lib.length (lib.attrNames list))} wallpapers
        '';
      };
    };
}

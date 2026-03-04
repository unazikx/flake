# INFO:
# watch movie/series/anime from hdrezka
# in terminal via fzf and mpv
#
# WARN:
# set url in ~/.config/hdrezka-tui/config.json
# or use --authFile PATH.txt

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          hmPackages = [ pkgs.own.rezka-fzf ];
        };
    };
}

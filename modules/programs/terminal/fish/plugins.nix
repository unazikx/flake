{
  ...
}:

{
  zen.programs.terminal.fish.plugins = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.grc
        ];

        programs.fish = {
          plugins =
            map
              (package: {
                inherit (package)
                  name
                  src
                  ;
              })
              [
                # keep-sorted start
                pkgs.fishPlugins.colored-man-pages
                pkgs.fishPlugins.fishbang
                pkgs.fishPlugins.fzf-fish
                pkgs.fishPlugins.git-abbr
                pkgs.fishPlugins.grc
                pkgs.fishPlugins.pisces
                pkgs.fishPlugins.puffer
                # keep-sorted end
              ];
        };
      };
  };
}

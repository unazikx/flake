# INFO:
# best shell
# needs upgrade/update
#
# WARN:
# integrates straship

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          persist.user.files = [ ".local/share/fish/fish_history" ];

          hmPackages = [ pkgs.grc ];

          programs.fish.enable = true;

          hm.programs = {
            fish = {
              inherit (config.programs.fish) enable;

              preferAbbrs = true;
              shellAbbrs = {
                gai = "git add --intent-to-add";
                gus = "git update-index --skip-worktree --assume-unchanged";
              };

              plugins =
                map
                  (p: {
                    inherit (p) name src;
                  })
                  (
                    lib.attrValues {
                      inherit (pkgs.fishPlugins)
                        colored-man-pages
                        autopair-fish
                        fzf-fish
                        git-abbr
                        puffer
                        grc
                        ;
                    }
                  );

              interactiveShellInit =
                let
                  d = "bind -M default";
                  v = "bind -M visual";
                  col = "set fish_color";
                  pag = "set fish_pager_color";

                  sel = "${pag}_selected";
                  sec = "${pag}_secondary";

                  bol = "--bold";
                  ita = "--italics";
                  bg = "--background";
                in
                # fish
                ''
                  fish_vi_key_bindings

                  # default
                  ${d} d delete-char
                  ${d} x cancel

                  # visual
                  ${v} x down-line

                  # colors
                  ${col}_cancel       ${bg}=red ${bol} black
                  ${col}_comment      gray

                  # pager
                  ${pag}_completion   white
                  ${sel}_completion   black  ${bol}
                  ${sec}_completion   white
                  ${pag}_prefix       white
                  ${sel}_prefix       black  ${bol}
                  ${pag}_description  yellow ${ita}
                  ${sel}_description  black
                  ${pag}_background   black
                  ${sel}_background          ${bg}=green
                  ${pag}_progress     black  ${bg}=red

                  set fish_greeting
                ''

              ;

              shellInitLast =
                # fish
                ''
                  set fish_cursor_default      block
                  set fish_cursor_insert       line
                  set fish_cursor_replace_one  underscore
                  set fish_cursor_replace      underscore
                  set fish_cursor_visual       block
                  set fish_cursor_external     line
                '';
            };

            starship = {
              enable = true;
              enableTransience = true;

              settings = import ./starship-conf.nix {
                inherit lib;
              };
            };

            pay-respects.enable = true;
          };
        };
    };
}

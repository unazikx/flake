# INFO:
# ls and cd replacement
# kekw
#
# INFO:
# fuzzy: write word to find file
# escape: exit frokm walk with cd to selected dir
# backspace: for cd ..
# space: for preview dirs/files
# enter: open file/enter to dir

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
          hm.programs.fish.functions =
            let
              inherit (config.lib.stylix.colors.withHashtag)
                base0E
                ;
            in
            {
              lk = {
                description = "Use walk as file manager";
                body = lib.concatStringsSep "\n" [
                  "set -x WALK_REMOVE_CMD ${lib.getExe' pkgs.trash-cli "trash-put"}"
                  ''set -x WALK_STATUS_BAR "Size() + ' | ' + Mode() + ' | ' + Owner()"''
                  ''set -x WALK_MAIN_COLOR "${base0E}"''
                  "set loc (${
                    lib.concatStringsSep " " [
                      (lib.getExe pkgs.walk)
                      "--fuzzy"
                      "--with-border"
                      "--icons"
                      "$argv"
                    ]
                  }); and cd $loc;"
                ];
              };
            };
        };
    };
}

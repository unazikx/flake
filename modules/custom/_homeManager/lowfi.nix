{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.lowfi;
in

{
  options = {
    programs.lowfi = {
      enable = lib.mkEnableOption "lowfi, a terminal-based lofi music player";

      package = lib.mkPackageOption pkgs "lowfi" {
        nullable = true;
      };

      trackLists = lib.mkOption {
        type = lib.types.attrsOf (
          lib.types.submodule {
            options = {
              url = lib.mkOption {
                type = lib.types.str;
                description = "Base URL for the track list";
              };
              tracks = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                description = "List of track paths relative to the base URL";
              };
            };
          }
        );
        default = { };
        example = lib.literalExpression ''
          {
            synthboy = {
              url = "https://lofigirl.com/wp-content/uploads/";
              tracks = [
                "2024/01/2.-aurora-ft.-Outgrown-master.mp3"
                "2023/11/Le-Metroid-Crystal-Children.mp3"
              ];
            };
          }
        '';

        description = ''
          Declarative track lists. Each attribute generates a .txt file
          that lowfi can use via <https://github.com/talwat/lowfi#custom-track-lists>.
        '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.dataFile = lib.mkIf (cfg.trackLists != { }) lib.mapAttrs' (name: tl: {
      name = "lowfi/${name}.txt";
      value = {
        text = lib.concatStringsSep "\n" (map (path: "${tl.url}${path}") tl.tracks);
      };
    }) cfg.trackLists;
  };
}

{
  zen.custom.xmcl = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.xmcl;
        json = pkgs.formats.json { };
      in
      {
        options = {
          programs.xmcl = {
            settings = lib.mkOption {
              type = json.type;
              default = { };
              description = "XMCL configuration options written to XDG config in JSON format.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "xmcl/setting.json".source = lib.mkIf (cfg.settings != { }) (
              json.generate "xmcl-setting.json" cfg.settings
            );
          };
        };
      };
  };
}

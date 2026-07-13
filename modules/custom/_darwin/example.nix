{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.example;
in

{
  imports = lib.singleton (
    lib.stylix.mkTarget
      {
        name = "example";
        humanName = "Example";
      }
      {
        config = [ ];
      }
  );

  options = {
    programs.example = {
      enable = lib.mkEnableOption "Example";

      package = lib.mkPackageOption pkgs "hello" {
        nullable = true;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib.mkIf (cfg.package != null) [ cfg.package ];
  };
}

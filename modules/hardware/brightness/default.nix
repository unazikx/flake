# INFO:
# for bug resolution

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
          ...
        }:
        {
          systemd.services.brightness = {
            description = "Sets brightness to 100";

            after = [ "basic.target" ];
            wantedBy = [ "basic.target" ];

            script = lib.concatStringsSep " " [
              (lib.getExe pkgs.light)
              "-A"
              (toString 100)
            ];
          };
        };
    };
}

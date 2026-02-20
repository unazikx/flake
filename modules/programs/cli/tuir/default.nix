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
          hmPackages = [ pkgs.tuir ];

          hm.xdg.configFile = {
            "tuir/tuir.cfg".text = lib.generators.toINI { } {
              tuir = {
                flash = "False";
                clipboard_cmd = "wl-copy";
              };
            };
          };
        };
    };
}

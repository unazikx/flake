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
        let
          ini = pkgs.formats.ini { };
        in
        {
          hmPackages = [ pkgs.tuir ];

          hm.xdg.configFile = {
            "tuir/tuir.cfg".source = ini.generate "tuir-config.cfg" {
              tuir = {
                flash = "False";
                clipboard_cmd = "wl-copy";
              };
            };
          };
        };
    };
}

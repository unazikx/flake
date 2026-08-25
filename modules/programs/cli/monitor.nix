{
  ...
}:

{
  zen.programs.cli.monitor =
    {
      config,
      ...
    }:
    {
      description = ''
        monitor system status
        CPU, RAM, NETWWORK, GPU...
      '';

      meta = {
        btop = pkgs: pkgs.btop;
      };

      nixos =
        {
          pkgs,
          lib,
          ...
        }:
        {
          security.wrappers.btop = {
            owner = "root";
            group = "root";
            capabilities = lib.concatStringsSep "," [
              "cap_perfmon"
              "cap_sys_admin"
              "cap_net_raw+ep"
            ];
            source = lib.getExe (config.meta.btop pkgs);
          };
        };

      homeManager =
        {
          pkgs,
          ...
        }:
        {
          home.packages = [
            pkgs.nvtopPackages.amd
          ];

          programs.btop = {
            enable = true;

            package = config.meta.btop pkgs;

            settings = {
              update_ms = 100;
              theme_background = true;
              vim_keys = true;
              rounded_corners = true;
            };
          };
        };
    };
}

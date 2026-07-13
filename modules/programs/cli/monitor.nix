{
  ...
}:

{
  zen.programs.cli.monitor = {
    description = ''
      monitor system status
      CPU, RAM, NETWWORK, GPU...
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.btop
          pkgs.nvtopPackages.amd
        ];

        programs.btop = {
          enable = true;

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

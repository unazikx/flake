# INFO:
# status your system with fps

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          persist.user.directories = [ ".mangohud-logs" ];

          hm.programs.mangohud = {
            enable = true;
            enableSessionWide = true;

            settings = {
              preset = 0;

              log_interval = 500;
              output_folder = "$HOME/.mangohud-logs";
            };
          };
        };
    };
}

# INFO:
# base util for synchronize
# from webdav etc

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
          hm = {
            programs.vdirsyncer.enable = true;
            services.vdirsyncer = {
              enable = true;

              frequency = "*:0/5"; # in minutes
              # sync will be in every 5 minutes

              verbosity = "INFO";
            };
          };
        };
    };
}

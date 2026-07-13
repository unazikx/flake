{
  ...
}:

{
  zen.miscellaneous.syncers.vdirsyncer = {
    homeManager =
      {
        ...
      }:
      {
        programs.vdirsyncer.enable = true;
        services.vdirsyncer = {
          enable = true;

          frequency = "*:0/5"; # in minutes
          # sync will be in every 5 minutes

          verbosity = "INFO";
        };
      };
  };
}

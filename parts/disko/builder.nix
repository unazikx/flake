# INFO:
# disko configurations builder
# sets up only path to config and device

{
  ...
}:

# WARN:
# edit only in cases
{
  flake =
    {
      ...
    }:
    {
      lib.buildDisko =
        # INFO:
        # arguments for bypass
        configurationName:
        {
          path ? throw "Set up <path>",
          device ? throw "Set up <device>",
        }:

        # INFO:
        # builder itself
        {
          ${configurationName} = import path {
            inherit
              device
              ;
          };
        };
    };
}

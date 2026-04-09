# INFO:
# sandbox program
# that reduces the risk of security breaches

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
          programs.firejail.enable = true;
        };
    };
}

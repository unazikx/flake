# INFO:
# generate cool stylished words
/*
    __ _       _      _
   / _(_)     | |    | |
  | |_ _  __ _| | ___| |_
  |  _| |/ _` | |/ _ \ __|
  | | | | (_| | |  __/ |_
  |_| |_|\__, |_|\___|\__|
          __/ |
         |___/
*/

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
        {
          hmPackages = [ pkgs.figlet ];
        };
    };
}

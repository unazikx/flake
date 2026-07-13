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
  ...
}:

{
  zen.programs.cli.figlet = {
    description = ''
      generate cool stylished words
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.figlet
        ];
      };
  };
}

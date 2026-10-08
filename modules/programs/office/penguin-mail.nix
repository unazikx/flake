{
  ...
}:

{
  zen.programs.office.penguin-mail = {
    description = ''
      gtk based mail client and calendar
    '';

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.packages.penguin-mail
        ];
      };
  };
}

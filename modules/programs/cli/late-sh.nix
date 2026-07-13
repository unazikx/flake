{
  ...
}:

{
  zen.programs.cli.late-sh = {
    description = ''
      cozy terminal clubhouse for developers
      companion CLI for local audio playback
    '';

    homeManager =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.late-sh.packages.late
        ];
      };
  };
}

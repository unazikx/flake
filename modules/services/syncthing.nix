{
  ...
}:

{
  zen.services.syncthing = {
    description = ''
      simple synchronizer between devices
      idk how but i will hide id devices
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.stc-cli
        ];

        services.syncthing = {
          enable = true;

          guiAddress = "0.0.0.0:8384";

          settings.options = {
            relaysEnabled = true;
            urAccepted = -1;
            localAnnounceEnabled = true;
            localAnnouncePort = 21027;
          };
        };
      };
  };
}

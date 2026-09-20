{
  zen,
  ...
}:

{
  zen.games.nixcraft.homestead = {
    includes = [
      zen.games.nixcraft
    ];

    homeManagerNixos =
      {
        pkgs,
        ...
      }:
      {
        nixcraft.client.instances = {
          "Homestead" = {
            # enableFeralGameMode = true;

            mrpack = {
              enable = true;

              file = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/6HvKwSky/versions/WMsE2fOj/Homestead%201.3.7.mrpack";
                hash = "sha256-1b0B4mwLeDmlZTZP1q1roPSL2wDPlIQXpxSCbB9pZNo=";
              };
            };

            java.package = pkgs.temurin-jre-bin-17;
          };
        };
      };
  };
}

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
          persist.directories = [ "/var/lib/clamav" ];

          services.clamav = {
            scanner.enable = true;
            daemon.enable = true;

            updater = {
              enable = true;

              interval = "daily";
              frequency = 3;

              settings = {
                ScriptedUpdates = "no";

                PrivateMirror = [
                  "https://clamav-mirror.ru/"
                  "https://mirror.truenetwork.ru/clamav/"
                  "http://mirror.truenetwork.ru/clamav/"
                ];
              };
            };
          };
        };
    };
}

{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        let
          sh = cmd: [
            "sh"
            "-c"
            cmd
          ];
        in
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              vdirsyncer
              ;
          };

          hm = {
            accounts.calendar = {
              basePath = "${config.hm.home.homeDirectory}/.calendar";

              accounts = {
                homeCalendar = {
                  primary = true;

                  remote.type = "google_calendar";
                  # nearly ill replace it

                  vdirsyncer = {
                    enable = true;

                    # if local db have conflict
                    # remote data will override local data
                    conflictResolution = "remote wins";
                    collections = [ "from a" ];

                    # get client id/secret here
                    # for google: https://console.cloud.google.com/apis
                    # Enabled API & services -> enable "Google Contacts CalDAV API"
                    # Credentials -> create client OAuth 2.0, copy data
                    # Audience -> add your email to "Test users"
                    clientIdCommand = sh "cat ${config.sopsnix."accounts/googleClient/id"}";
                    clientSecretCommand = sh "cat ${config.sopsnix."accounts/googleClient/secret"}";

                    tokenFile = "${config.hm.accounts.calendar.basePath}/homeCalendar/token";
                  };

                  khal = {
                    inherit (config.hm.programs.khal) enable;
                    color = config.lib.stylix.colors.withHashtag.base0B;
                  };
                };
              };
            };

            programs = {
              khal = {
                enable = true;
                locale.weeknumbers = "left";
              };
            };
          };
        };
    };
}

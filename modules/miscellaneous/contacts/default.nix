{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
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
            accounts.contact = {
              basePath = "${config.hm.home.homeDirectory}/.contacts";

              accounts = {
                homeContacts = {
                  remote.type = "google_contacts";
                  # nearly ill replace it

                  vdirsyncer = {
                    enable = true;

                    # if local db have conflict
                    # remote data will override local data
                    conflictResolution = "remote wins";
                    collections = [ "from a" ];

                    # get client id/secret here
                    # for google: https://console.cloud.google.com/apis
                    # Enabled API & services -> enable "Google Contacts CardDAV API"
                    # Credentials -> create client OAuth 2.0, copy data
                    # Audience -> add your email to "Test users"
                    clientIdCommand = sh "cat ${config.sopsnix."accounts/googleClient/id"}";
                    clientSecretCommand = sh "cat ${config.sopsnix."accounts/googleClient/secret"}";

                    tokenFile = "${config.hm.accounts.contact.basePath}/homeContacts/token";
                  };

                  khard = {
                    inherit (config.hm.programs.khard) enable;
                    addressbooks = [ "default" ];
                  };
                };
              };
            };

            programs.khard = {
              enable = true;

              settings = {
                "general" = {
                  debug = "no";
                  default_action = "list";
                  editor = [ "$EDITOR" ];
                  merge_editor = lib.getExe pkgs.delta;
                };

                "contact table".display = "first_name";
              };
            };
          };
        };
    };
}

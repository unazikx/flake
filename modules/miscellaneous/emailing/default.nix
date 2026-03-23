# INFO:
# module for emailing
# and supporting clients

{
  flake =
    {
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
          cfg = config.hm.services.mbsync;
        in
        {
          persist.user.directories = [
            ".email"
          ];

          hm = {
            accounts.email = {
              maildirBasePath = "${config.hm.home.homeDirectory}/.email";

              accounts.homeMail = {
                primary = true;
                flavor = "gmail.com";
                # it makes auto set imap/smtp

                realName = "Aziz Kurbonov";
                address = "xfalwa@gmail.com";

                # WARN:
                # if u dont use 2fa  write default password
                # if u use 2fa open this page and generate key
                # https://myaccount.google.com/apppasswords
                # write as 16 digit word without spaces
                passwordCommand = "cat ${config.sopsnix."accounts/gmailPassword"}";

                # just perfection
                # aerc folders are same
                folders = {
                  sent = " sent";
                  inbox = " inbox";
                  trash = " trash";
                  drafts = " drafts";
                };

                mbsync = {
                  enable = true;
                  patterns = [ "*" ];

                  extraConfig = {
                    channel = {
                      CopyArrivalDate = "yes";
                    };
                  };

                  groups =
                    let
                      mkAll =
                        list:
                        lib.mapAttrs (
                          _n: ch:
                          {
                            extraConfig = {
                              Create = "Both";
                              Expunge = "Both";
                            };
                          }
                          // ch
                        ) list;
                    in
                    {
                      core.channels = mkAll {
                        inbox = {
                          farPattern = "INBOX";
                          nearPattern = " inbox";
                        };

                        archive = {
                          farPattern = "[Gmail]/All Mail";
                          nearPattern = " archive";
                        };

                        sent = {
                          farPattern = "[Gmail]/Sent Mail";
                          nearPattern = " sent";
                        };

                        trash = {
                          farPattern = "[Gmail]/Trash";
                          nearPattern = " trash";
                        };
                      };

                      extra.channels = mkAll {
                        drafts = {
                          farPattern = "[Gmail]/Drafts";
                          nearPattern = " drafts";
                        };

                        starred = {
                          farPattern = "[Gmail]/Starred";
                          nearPattern = " starred";
                        };

                        important = {
                          farPattern = "[Gmail]/Important";
                          nearPattern = "󰯨 important";
                        };

                        spam = {
                          farPattern = "[Gmail]/Spam";
                          nearPattern = " spam";
                        };
                      };
                    };
                }
                // lib.genAttrs [
                  "create"
                  "expunge"
                  "remove"
                ] (_n: "both"); # lazy...

                # frontends
                aerc = {
                  inherit (config.hm.programs.aerc)
                    enable
                    ;

                  extraAccounts = {
                    folders-sort = [
                      " inbox"
                      " sent"
                      " drafts"
                      " starred"
                      "󰯨 important"
                      " archive"
                      " spam"
                      " trash"
                    ];
                  };
                };
              };
            };

            # idk why to separate it to nixosModules.??
            programs.mbsync.enable = true;
            services.mbsync = {
              enable = true;

              frequency = "*:0/5"; # in minutes
              # sync will be in every 5 minutes

              verbose = true;
            };

            systemd.user.services.mbsync-oneshot = {
              Unit = {
                Description = cfg.package.meta.description;
                After = [ "network-online.target" ];
              };

              Service = {
                ExecStart = lib.concatStringsSep " " [
                  (lib.getExe cfg.package)
                  "-aV"
                ];

                Type = "oneshot";
              };
            };
          };
        };
    };
}

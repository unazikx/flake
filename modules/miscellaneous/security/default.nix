# INFO:
# security on 1st place...but not for me

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          security = {
            polkit.enable = true;
            soteria.enable = true;

            sudo.enable = false;
            sudo-rs = {
              enable = true;

              execWheelOnly = true;
              wheelNeedsPassword = true;

              extraRules = [
                {
                  users = [ lib.userName ];

                  groups = [ "wheel" ];
                  runAs = "root";

                  commands = [
                    {
                      command = lib.getExe pkgs.light;
                      options = [ "NOPASSWD" ];
                    }
                    {
                      command = lib.getExe' pkgs.coreutils "tee";
                      options = [ "NOPASSWD" ];
                    }
                  ];
                }
              ];
            };

            pam.services =
              lib.genAttrs
                [
                  "su"
                  "sudo"
                  "login"
                ]
                (n: {
                  fprintAuth = true;
                });
          };
        };
    };
}

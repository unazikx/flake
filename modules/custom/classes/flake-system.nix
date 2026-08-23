{
  inputs,
  den,
  zen,
  ...
}:

{
  den.classes = {
    # keep-sorted start
    actions = { };
    disko = { };
    diskoUSB = { };
    overlays = { };
    root = { };
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
    actions-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "actions";
          intoClass = "flake";
          path = [
            "flake"
            "REPLACE_ME"
          ];
        })
      ];

    disko-other-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "diskoUSB";
          intoClass = "flake";
          path = [
            "flake"
            "diskoConfigurations"
          ];
        })
      ];

    disko-to-flake-system =
      {
        host,
        ...
      }:
      [
        (den.lib.policy.include {
          nixos =
            {
              self,
              ...
            }:
            {
              imports = [
                inputs.disko.nixosModules.default
                self.diskoConfigurations.${host.hostName}
              ];
            };
        })

        (den.lib.policy.route {
          fromClass = "disko";
          intoClass = "flake";
          path = [
            "flake"
            "diskoConfigurations"
            host.hostName
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    overlays-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "overlays";
          intoClass = "flake";
          path = [
            "flake"
            "overlays"
          ];
        })
      ];

    root-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "root";
          intoClass = "flake";
          path = [
            "flake"
          ];
        })
      ];
    # keep-sorted end
  };

  den.schema.flake-system.includes = [
    # keep-sorted start
    den.policies.actions-to-flake-system
    den.policies.disko-other-to-flake-system
    den.policies.disko-to-flake-system
    den.policies.overlays-to-flake-system
    den.policies.root-to-flake-system
    zen.flake-system.default
    # keep-sorted end
  ];
}

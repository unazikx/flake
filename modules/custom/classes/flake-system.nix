{
  inputs,
  den,
  zen,
  ...
}:

{
  den.classes = {
    # keep-sorted start
    disko = { };
    diskoUSB = { };
    actions = { };
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
    disko-other-to-flake =
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

    actions-to-flake =
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

    disko-to-flake =
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
    # keep-sorted end
  };

  den.schema.flake-system.includes = [
    # keep-sorted start
    den.policies.actions-other-to-flake
    den.policies.disko-other-to-flake
    den.policies.disko-to-flake
    zen.flake-system.default
    # keep-sorted end
  ];
}

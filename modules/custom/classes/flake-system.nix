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
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
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
    # keep-sorted end
  };

  den.schema.flake-system.includes = [
    # keep-sorted start
    zen.disko.default
    den.policies.disko-to-flake
    den.policies.disko-other-to-flake
    # keep-sorted end
  ];
}

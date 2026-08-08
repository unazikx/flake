{
  den,
  zen,
  ...
}:

{
  den.classes = {
    # keep-sorted start
    apps = { };
    devshell = { };
    files = { };
    packages = { };
    treefmt = { };
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
    apps-to-flake-parts = _: [
      (den.lib.policy.route {
        fromClass = "apps";
        intoClass = "flake-parts";
        path = [
          "apps"
        ];
        adaptArgs =
          {
            config,
            ...
          }:
          config.allModuleArgs;
      })
    ];

    files-to-flake-parts = _: [
      (den.lib.policy.route {
        fromClass = "files";
        intoClass = "flake-parts";
        path = [
          "files"
        ];
        adaptArgs =
          {
            config,
            ...
          }:
          config.allModuleArgs;
      })
    ];

    makeshell-to-flake-parts = _: [
      (den.lib.policy.route {
        fromClass = "make-shell";
        intoClass = "flake-parts";
        path = [
          "make-shell"
        ];
        adaptArgs =
          {
            config,
            ...
          }:
          config.allModuleArgs;
      })
    ];

    root-to-flake-parts = _: [
      (den.lib.policy.route {
        fromClass = "root";
        intoClass = "flake-parts";
        path = [ ];
        adaptArgs =
          {
            config,
            ...
          }:
          config.allModuleArgs;
      })
    ];

    treefmt-to-flake-parts = _: [
      (den.lib.policy.route {
        fromClass = "treefmt";
        intoClass = "flake-parts";
        path = [
          "treefmt"
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

  den.schema.flake-parts.includes = [
    # keep-sorted start
    zen.flake-parts.default
    den.policies.apps-to-flake-parts
    den.policies.files-to-flake-parts
    den.policies.makeshell-to-flake-parts
    den.policies.packages-to-flake-parts
    den.policies.root-to-flake-parts
    den.policies.treefmt-to-flake-parts
    # keep-sorted end
  ];

  den.schema.flake-system.excludes = [
    # keep-sorted start
    den.policies.packages-to-flake
    # keep-sorted end
  ];
}

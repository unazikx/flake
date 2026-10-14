{
  inputs,
  config,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    flake-file = {
      type = "github";
      owner = "unazikx";
      repo = "flake-file";
    };
    # keep-sorted end
  };

  imports = [
    inputs.flake-file.flakeModules.lon
  ];

  flake-file = {
    do-not-edit = "";

    outputs =
      # nix
      ''
        inputs:
        inputs.flake-parts.lib.mkFlake
          {
            inherit inputs;
          }
          (
            inputs.import-tree [
              ./configurations
              ./files
              ./modules
              ./shells
            ]
          )
      '';

    lon.lockDir = ".lon";

    prune-lock.enable = true;

    style = {
      sep.inputs = "
          \n
        ";

      sortPriority = {
        flake = [
          "description"
          "inputs"
          "outputs"
          "nixConfig"
        ];
      };
    };
  };

  zen.flake-parts.default = {
    packages =
      {
        pkgs,
        ...
      }:
      {
        write-lon = config.flake-file.apps.write-lon pkgs;
        write-tack = config.flake-file.apps.write-tack pkgs;
        write-lock = config.flake-file.apps.write-lock pkgs;
      };
  };
}

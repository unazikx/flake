{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    jovian-nixos = {
      type = "github";
      owner = "jovian-experiments";
      repo = "jovian-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.jovian-nixos = {
    description = ''
      precompiled and bleeding edge packages
      have binares for jovian also
    '';

    includes = [
      zen.miscellaneous.chaotic-nyx
    ];

    nixos =
      {
        inputs,
        user,
        ...
      }:
      {
        imports = [
          inputs.jovian-nixos.nixosModules.jovian
        ];

        jovian = {
          decky-loader = {
            enable = true;

            user = user.userName;
          };
        };

        nixpkgs.config = {
          permittedInsecurePackages = [
            "pnpm-9.15.9"
          ];
        };
      };

    homeManager =
      {
        config,
        ...
      }:
      {
        systemd.user.tmpfiles.rules = [
          "f ${config.xdg.dataHome}/Steam/.cef-enable-remote-debugging - ${config.home.username} users - -"
        ];
      };
  };
}

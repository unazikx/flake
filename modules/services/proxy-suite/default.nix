{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    proxy-suite-flake = {
      type = "github";
      owner = "fufsob";
      repo = "proxy-suite-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.services.proxy-suite = {
    description = ''
      bundles sing-box,
      zapret-discord-youtube,
      and tg-ws-proxy
    '';

    includes = [
      zen.services.proxy-suite.amneziawg
      zen.services.proxy-suite.proxy
      zen.services.proxy-suite.tg-ws-proxy
      zen.services.proxy-suite.zapret
    ];

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.proxy-suite-flake.nixosModules.default
        ];

        services.proxy-suite = {
          enable = true;
        };
      };
  };
}

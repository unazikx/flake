{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    ncro = {
      type = "github";
      owner = "manic-systems";
      repo = "ncro";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.miscellaneous.nix.ncro = {
    nixos =
      {
        inputs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.ncro;

        toUpstream =
          priority: cache:
          let
            url = lib.head (lib.attrNames cache);
          in
          {
            inherit
              url
              priority
              ;
            public_keys = cache.${url};
          };
      in
      {
        imports = [
          inputs.ncro.nixosModules.ncro
        ];

        services.ncro = {
          enable = true;

          settings = {
            server = {
              listen = ":8030";
            };

            upstreams = lib.imap1 toUpstream [
              {
                "https://cache.nixos.org" = [
                  "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                ];
              }
              {
                "https://xache.cachix.org" = [
                  "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA="
                ];
              }
              {
                "https://nix-community.cachix.org" = [
                  "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                ];
              }
              {
                "https://install.determinate.systems" = [
                  "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
                ];
              }
              {
                "https://niri.cachix.org" = [
                  "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
                ];
              }
              {
                "https://vicinae.cachix.org" = [
                  "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
                ];
              }
              {
                "https://nix-gaming.cachix.org" = [
                  "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                ];
              }
              {
                "https://nvf.cachix.org" = [
                  "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
                ];
              }
            ];

            logging = {
              timestamps = false;
            };
          };
        };

        nix.settings =
          let
            proxy = lib.singleton "http://localhost${cfg.settings.server.listen}";
          in
          {
            substituters = lib.mkForce proxy;
            trusted-substituters = lib.mkForce proxy;
          };
      };
  };
}

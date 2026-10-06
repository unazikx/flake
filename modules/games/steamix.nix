{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    jovian = {
      type = "github";
      owner = "jovian-experiments";
      repo = "jovian-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-github-actions.follows = "";
    };

    steamix = {
      type = "github";
      owner = "arunoruto";
      repo = "steamix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.steamix = {
    description = ''
      massive configurator for NixOS alike it steamos
    '';

    includes = [
      zen.games.steam
    ];

    wiki = {
      "Millennium" = {
        links = [ ];
      };
    };

    nixos =
      {
        inputs,
        inputs',
        ...
      }:
      {
        imports = [
          inputs.steamix.nixosModules.default
        ];

        steamix = {
          enable = true;
          autoStart = false;

          binaryCache.enable = false;
          mangoapp.enable = false;
          manager.enable = true;

          decky-loader = {
            enable = false;
            package = inputs'.jovian.legacyPackages.decky-loader;

            plugins = [ ];
          };
        };
      };

    homeManagerNixos =
      {
        config,
        ...
      }:
      {
        systemd.user.tmpfiles.rules = [
          "f ${config.xdg.dataHome}/Steam/.cef-enable-remote-debugging 644 - - - -"
        ];
      };

    provides = {
      jetpure.nixos =
        {
          ...
        }:
        {
          steamix.desktopSession = "umbriel"; # cause
        };
    };
  };
}

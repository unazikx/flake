{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    halley-flake = {
      type = "github";
      owner = "binarylinuxx";
      repo = "halley-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.halley-unstable-dev-src.follows = "";
    };
    # keep-sorted end
  };

  zen.programs.desktop.halley = {
    description = ''
      infinite canvas wayland
      like newm but other...idk
      and similar to driftwm
    '';

    includes = [ ];

    nixos =
      {
        inputs,
        inputs',
        lib,
        config,
        user,
        ...
      }:
      {
        imports = [
          inputs.halley-flake.nixosModules.default
        ];

        programs.halley = {
          enable = true;
          package = inputs'.halley-flake.packages.halley-unstable;
        };

        # fucking idiots why blyat?
        # я вас всех в жопу ебал бляди нахуя
        services = {
          displayManager = {
            defaultSession = lib.mkIf (user.defaultWm == "halley") "halley-session";
          };

          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "halley") {
              user = lib.userName;
              command = lib.getExe' config.programs.halley.package "halley-session";
            };
          };
        };
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      {
        programs.halley = {
          enable = true;
          package = osConfig.programs.halley.package;

          settings = null; # i not tried yet
        };

        # та же хуйня:wq
        services.gnome-keyring.enable = lib.mkForce false;
      };
  };
}

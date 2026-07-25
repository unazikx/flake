{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    mangowc = {
      type = "github";
      owner = "mangowm";
      repo = "mango";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };

  zen.programs.desktop.mangowc = {
    description = ''
      very customizable window manager
      idk i will use it...
      somewhen, idk
    '';

    includes = [
      # zen.programs.desktop.mangowc.settings
    ];

    nixos =
      {
        inputs,
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      {
        imports = [
          inputs.mangowc.nixosModules.mango
        ];

        programs.mango = {
          enable = true;

          package = pkgs.mango;
        };

        services = {
          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "mangowc") {
              user = user.userName;
              command = lib.getExe config.programs.mango.package;
            };
          };
        };
      };

    homeManagerNixos =
      {
        inputs,
        osConfig,
        ...
      }:
      {
        imports = [
          inputs.mangowc.hmModules.mango
        ];

        wayland.windowManager.mango = {
          enable = true;

          package = osConfig.programs.mango.package;

          systemd.enable = true;
        };
      };
  };
}

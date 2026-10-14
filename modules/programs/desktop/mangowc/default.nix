{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   mangowc = {
  #     type = "github";
  #     owner = "mangowm";
  #     repo = "mango";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.desktop.mangowc = {
    description = ''
      very customizable window manager
      idk i will use it...
      somewhen, idk
    '';

    includes = [
      zen.programs.desktop.keyring
      # zen.programs.desktop.mangowc.settings
    ];

    nixos =
      {
        inputs,
        pkgs,
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

{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    shojiwm = {
      type = "github";
      owner = "bea4dev";
      repo = "shojiwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.desktop.shojiwm = {
    description = ''
      customizable compositor
      it is just comp
      window management u built yourself
    '';

    nixos =
      {
        inputs,
        lib,
        config,
        user,
        ...
      }:
      {
        imports = [
          inputs.shojiwm.nixosModules.default
        ];

        programs.shojiwm = {
          enable = true;

          initConfig = {
            enable = true;
            users = [ user.userName ];
          };
        };

        services = {
          displayManager = {
            defaultSession = lib.mkIf (user.defaultWm == "shojiwm") "ShojiWM";
          };

          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "shojiwm") {
              user = user.userName;
              command = "${lib.getExe config.programs.shojiwm.package} --tty";
            };
          };
        };
      };
  };
}

{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    vicinae = {
      type = "github";
      owner = "vicinaehq";
      repo = "vicinae";
    };

    vicinae-extensions = {
      type = "github";
      owner = "vicinaehq";
      repo = "extensions";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.vicinae.follows = "vicinae";
    };
    # keep-sorted end
  };

  zen.programs.desktop.vicinae = {
    description = ''
      raycast like launcher
    '';

    homeManager =
      {
        inputs,
        inputs',
        pkgs,
        config,
        ...
      }:
      let
        extensions = inputs'.vicinae-extensions.packages;
      in
      {
        imports = [
          inputs.vicinae.homeManagerModules.default
        ];

        programs.vicinae = {
          enable = true;
          package = pkgs.vicinae;

          settings = {
            # launcher_window.compact_mode = {
            #   enabled = true;
            # };

            providers = {
              "@knoopx/vicinae-extension-firefox-0" = {
                preferences.profile_dir = config.programs.librewolf.configPath;
              };

              "@sei40kr/vicinae-extension-wikipedia-0" = {
                preferences.viewType = "grid";
              };
            };
          };

          extensions = [
            # keep-sorted start block=yes
            extensions.color-converter
            extensions.firefox
            extensions.keepassxc
            extensions.nix
            extensions.protondb-search
            extensions.timer
            extensions.wallhaven
            extensions.wikipedia
            extensions.zoxide-recent-directories
            # keep-sorted end
          ];

          systemd = {
            enable = true;
            autoStart = true;

            environment = {
              USE_LAYER_SHELL = 1;
            };
          };
        };
      };
  };
}

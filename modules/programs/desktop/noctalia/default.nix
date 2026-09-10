{
  zen,
  ...
}:

{
  zen.programs.desktop.noctalia = {
    description = ''
      modern desktop shell
      very good im impressed
    '';

    includes = [
      zen.miscellaneous.users.accounts
      zen.programs.desktop.noctalia.settings
    ];

    wiki = {
      "Noctalia" = {
        extra = ''
          dont use their flake, noctalia also in nixpkgs

          use `nix eval --expr --impure 'builtins.fromTOML (builtins.readFile ./noctalia.toml)'`
          for make nix attrs config from toml
        '';

        links = [
          {
            name = "noctalia-wiki";
            link = "https://docs.noctalia.dev/noctalia";
            logo = "https://docs.noctalia.dev/_astro/noctalia-logo.BwXc-yKG.svg";
          }
        ];
      };
    };

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        services.udev.extraRules =
          # udev
          ''
            ACTION=="remove", ENV{ID_MODEL_ID}=="0407", ENV{ID_VENDOR_ID}=="1050", RUN+="${lib.getExe' pkgs.systemd "loginctl"} lock-sessions"
          '';

        security.pam.services = {
          quickshell.u2fAuth = true;
          swaylock.u2fAuth = true;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        programs.noctalia = {
          enable = true;
        };

        stylix.targets = {
          noctalia.enable = true;
        };
      };
  };
}

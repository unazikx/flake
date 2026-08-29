{
  ...
}:

{
  zen.hosts.blackmamba = {
    nixos =
      {
        self',
        inputs,
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        stylix = {
          polarity = "dark";

          base16Scheme = lib.mkForce "${inputs.tinted-theming}/base16/classic-dark.yaml";

          image = lib.stylix.mkImage pkgs (pkgs.fetchurl {
            url = "https://w.wallhaven.cc/full/w5/wallhaven-w5x65p.jpg";
            sha256 = "sha256-aUTvlXBCEwi6gPmosh4vgTzbcr3YyJllFm0E5lLW5ks=";
          }) colors.toList;

          icons = {
            enable = true;

            dark = "Papirus-Dark";
            light = "Papirus-Light";

            package = pkgs.papirus-icon-theme;
          };

          cursor = {
            size = 24;
            name = "googledot-custom";
            package = self'.packages.cursors-google-cursor.override {
              background_color = colors.withHashtag.base0E;
              outline_color = colors.withHashtag.base00;
              accent_color = colors.withHashtag.base0E;
            };
          };

          fonts = {
            monospace = {
              package = pkgs.nerd-fonts.caskaydia-cove;
              name = "CaskaydiaCove Nerd Font Propo";
            };

            sansSerif = {
              package = pkgs.inter;
              name = "Inter";
            };

            serif = {
              package = pkgs.inter;
              name = "Inter";
            };

            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };

            sizes = {
              desktop = 12;
              popups = 12;
              applications = 14;
              terminal = 14;
            };
          };
        };

        fonts.packages = [
          # keep-sorted start
          pkgs.arkpandora_ttf
          pkgs.corefonts
          pkgs.gelasio
          pkgs.inter
          pkgs.liberation_ttf
          pkgs.monocraft
          pkgs.noto-fonts
          pkgs.noto-fonts-cjk-sans
          self'.packages.fonts-gost
          self'.packages.fonts-segoe
          # keep-sorted end
        ];
      };
  };
}

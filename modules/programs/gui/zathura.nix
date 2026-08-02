{
  ...
}:

{
  zen.programs.gui.zathura = {
    description = ''
      pdf viewer
      with zaread -> converts office into pdf
    '';

    homeManager =
      {
        self',
        pkgs,
        lib,
        config,
        ...
      }:
      {
        home.packages = [
          (self'.legacyPackages.zaread.override {
            libreoffice = pkgs.libreoffice-fresh;
          })
        ];

        programs.zathura = {
          enable = true;

          package = pkgs.zathura.override {
            useMupdf = true;
          };

          options = {
            guioptions = "none";

            selection-clipboard = "clipboard";
            smooth-scroll = true;

            window-title-home-tilde = true;
            statusbar-home-tilde = true;

            page-right-to-left = true;
            first-page-column = "1:1";

            font = lib.concatStringsSep " " [
              config.stylix.fonts.sansSerif.name
              (toString config.stylix.fonts.sizes.applications)
            ];
          };

          mappings = {
            m = "toggle_page_mode";
          };
        };
      };
  };
}

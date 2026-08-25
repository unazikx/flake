{
  zen,
  ...
}:

{
  zen.programs.gui.zathura = {
    description = ''
      pdf viewer
      with zaread -> converts office into pdf
    '';

    includes = [
      zen.programs.gui.libreoffice
    ];

    homeManager =
      {
        self',
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.zathura;
        libreoffice = config.programs.libreoffice;
      in
      {
        home.packages = [
          (self'.packages.zaread.override {
            libreoffice = libreoffice.package;
            zathura = cfg.package;
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

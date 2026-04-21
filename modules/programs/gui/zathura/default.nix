# INFO:
# pdf viewer
# with zaread:
#   converts office into pdf

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          hmPackages = [
            pkgs.own.zaread
          ];

          hm.programs.zathura = {
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

          hmMime = lib.mkMime {
            "org.pwmt.zathura-cb.desktop" = [
              "application/pdf"
              "application/x-cbt"
              "application/x-cbr"
              "application/x-cbz"
              "application/epub+zip"
              "application/vnd.comicbook-rar"
              "application/vnd.comicbook+zip"
            ];
          };
        };
    };
}

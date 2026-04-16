# INFO:
# good office for home
# analog ms office

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
          ...
        }:
        {
          persist.user.directories = [
            ".config/libreoffice"
          ];

          hmPackages = with pkgs; [
            libreoffice-fresh
            poppler-utils
          ];

          hmMime = lib.mkMime {
            "libreoffice.desktop" = [
              # keep-sorted start

              "application/msword"
              "application/vnd.ms-excel"
              "application/vnd.ms-powerpoint"
              "application/vnd.oasis.opendocument.chart"
              "application/vnd.oasis.opendocument.database"
              "application/vnd.oasis.opendocument.formula"
              "application/vnd.oasis.opendocument.graphics"
              "application/vnd.oasis.opendocument.graphics-template"
              "application/vnd.oasis.opendocument.image"
              "application/vnd.oasis.opendocument.presentation"
              "application/vnd.oasis.opendocument.presentation-template"
              "application/vnd.oasis.opendocument.spreadsheet"
              "application/vnd.oasis.opendocument.spreadsheet-template"
              "application/vnd.oasis.opendocument.text"
              "application/vnd.oasis.opendocument.text-master"
              "application/vnd.oasis.opendocument.text-template"
              "application/vnd.oasis.opendocument.text-web"
              "application/vnd.openxmlformats-officedocument.presentationml.presentation"
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
              "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
              "text/csv"
              # keep-sorted end
            ];
          };
        };
    };
}

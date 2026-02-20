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
          persist.user.directories = [
            "Desktop"
            "Documents"
            "Downloads"
            "Music"
            "Pictures"
            "Videos"
          ];

          hm = {
            xdg = {
              enable = true;

              mime.enable = true;

              mimeApps = {
                enable = true;

                associations.added = config.hm.xdg.mimeApps.defaultApplications;
              };

              userDirs = {
                enable = true;
                createDirectories = true;

                # INFO:
                # xdg default
                # desktop = "/Desktop";
                # documents = "/Documents";
                # download = "/Downloads";
                # music = "/Music";
                # pictures = "/Pictures";
                # videos = "/Videos";

                # publicShare = null;
                # templates = null;

                extraConfig = {
                  SCREENSHOTS = config.hm.xdg.userDirs.pictures + "/screenshots";
                  FLAKE = toString lib.flakeDir;
                  TORRENTS = config.services.qbittorrent.serverConfig.BitTorrent.Session.DefaultSavePath;
                };
              };

              desktopEntries =
                lib.genAttrs
                  [
                    # qt
                    "qt5ct"
                    "qt6ct"
                  ]
                  (name: {
                    inherit name;
                    noDisplay = true;
                  });

              terminal-exec = {
                enable = true;
                package = pkgs.xdg-terminal-exec;

                settings = {
                  default = [
                    "kitty.desktop"
                    "foot.desktop"
                  ];
                };
              };

              portal.enable = true;
            };

            gtk.gtk3.bookmarks =
              let
                mkDirs =
                  subDir: mainDir:
                  (lib.concatStringsSep "/" [
                    "file:/"
                    subDir
                    mainDir
                  ]);
              in

              # home place
              (map (dir: (mkDirs config.hm.home.homeDirectory dir)) [
                "Documents"
                "Downloads"
                "Music"
                "Pictures"
                "Videos"
              ])
              ++
                # other fs place
                (map (dir: (mkDirs (toString null) dir)) [ lib.flakeDir ]);
          };
        };
    };
}

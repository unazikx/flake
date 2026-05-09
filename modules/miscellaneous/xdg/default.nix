# INFO:
# goon experience

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
        let
          directories = [
            # keep-sorted start
            "Desktop"
            "Documents"
            "Downloads"
            "Music"
            "Pictures"
            "Public"
            "Videos"
            # keep-sorted end
          ];
        in
        {
          persist.user = { inherit directories; };

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
                setSessionVariables = true;

                # INFO:
                # xdg default
                # desktop = "/Desktop";
                # documents = "/Documents";
                # download = "/Downloads";
                # music = "/Music";
                # pictures = "/Pictures";
                # videos = "/Videos";

                # publicShare = null;
                templates = null;

                extraConfig = {
                  SCREENSHOTS = config.hm.xdg.userDirs.pictures + "/screenshots";
                  FLAKE = toString lib.flakeDir;
                  TORRENTS = config.services.qbittorrent.serverConfig.BitTorrent.Session.DefaultSavePath;
                  PASSWORDS = config.hm.xdg.userDirs.publicShare + "/passwords";
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
                    "foot.desktop"
                    "kitty.desktop"
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
              (map (dir: (mkDirs config.hm.home.homeDirectory dir)) directories);
          };
        };
    };
}

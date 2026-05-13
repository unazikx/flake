# INFO:
# tui email client

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
          partsConfig,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              emailing
              ;
          };

          hm.programs.aerc = {
            enable = true;

            extraConfig = {
              general = {
                unsafe-accounts-conf = true;
                default-save-path = config.hm.xdg.userDirs.download;
                default-menu-cmd = lib.getExe pkgs.fzf;
              };

              viewer = {
                show-headers = false;
                always-show-mime = true;
              };

              compose = {
                edit-headers = true;
                reply-to-self = false;

                # editor = getExe pkgs.vim;
              }
              // (
                let
                  cfg = config.hm.programs.khard;
                in
                lib.optionalAttrs cfg.enable {
                  address-book-cmd = (lib.getExe cfg.package) + " %s";
                }
              );

              ui = {
                styleset-name = "stylix";
                sidebar-width = 15;

                tab-title-account = " {{.Account}}";
                dirlist-left = " {{.Folder}} ";

                fuzzy-complete = true;
                mouse-enabled = false;
                msglist-scroll-offset = 5;
                show-thread-context = true;

                border-char-vertical = "│";
                border-char-horizontal = "─";
                spinner = "◜,◠,◝,◞,◡,◟";
                threading-enabled = true;
              };

              statusline = {
                column-left = "[ {{.Account}}]";
                column-center = "{{.PendingKeys}}";
                column-right = "{{.TrayInfo}} [ {{.StatusInfo}}]";
              };

              filters = {
                "text/plain" = "colorize";
                "text/calendar" = "calendar";
                "text/html" = "html | colorize";

                "application/pdf" = lib.getExe pkgs.zathura + " -";

                "audio/*" = lib.getExe pkgs.mpv + " -";
                "video/*" = lib.getExe pkgs.mpv + " -";
                "image/*" = lib.getExe pkgs.swayimg + " -";
              };
            };

            extraBinds = import ./binds.nix;

            stylesets.stylix = import ./theme.nix {
              inherit
                config
                ;
            };
          };
        };
    };
}

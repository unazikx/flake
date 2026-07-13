{
  ...
}:

{
  zen.programs.cli.gdu = {
    description = ''
      disk usage from directory
      > gdu /path/to/path
    '';

    homeManager =
      {
        config,
        ...
      }:
      {
        programs.gdu = {
          enable = true;

          settings =
            let
              colors = config.lib.stylix.colors.withHashtag;
            in
            ''
              style:
                selected-row:
                  text-color: "${colors.base0B}"
                  background-color: "${colors.base02}"
                result-row:
                  directory-color: "${colors.base0B}"
                  number-color: "${colors.base0F}"
                footer:
                  text-color: "${colors.base05}"
                  background-color: "${colors.base01}"
                  number-color: "${colors.base08}"
                header:
                  text-color: "${colors.base05}"
                  background-color: "${colors.base01}"
                  hidden: true

              log-file: "/dev/null"
              max-cores: 4
              follow-symlinks: false

              show-apparent-size: false
              show-relative-size: false
              show-item-count: true
              show-mtime: true
              sequential-scanning: false

              no-mouse: true
              non-interactive: false
              no-progress: false
              no-unicode: false
              no-cross: false
              no-hidden: false
              no-delete: false

              use-si-prefix: true

              progress-modal.current-item-path-max-len: 0
              style.use-old-size-bar: true
              delete-in-background: true
              delete-in-parallel: true
              sorting:
                order: "desc"

              ignore-dirs:
                - /proc
                - /dev
                - /sys
                - /run
            '';
        };
      };
  };
}

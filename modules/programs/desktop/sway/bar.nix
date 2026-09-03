{
  zen,
  ...
}:

{
  zen.programs.desktop.sway.bar = {
    includes = [
      zen.programs.desktop.i3status-rust
    ];

    homeManagerNixos =
      {
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        fonts = config.stylix.fonts;

        cfg = config.wayland.windowManager.sway;
        statusCfg = config.programs.i3status-rust;
      in
      {
        wayland.windowManager.sway.config = {
          bars = lib.singleton {
            id = toString 0;
            position = "bottom";
            mode = "dock";

            command = lib.getExe' cfg.package "swaybar";
            statusCommand = "${lib.getExe statusCfg.package} ${
              lib.concatStringsSep "/" [
                config.xdg.configHome
                "i3status-rust"
                "config-default.toml"
              ]
            }";

            trayOutput = "none";

            fonts = {
              size = toString fonts.sizes.desktop;
              names = [ fonts.monospace.name ];
            };

            colors = lib.mkForce {
              background = colors.base00;
              statusline = colors.base05;

              activeWorkspace = {
                background = colors.base01;
                border = colors.base01;
                text = colors.base05;
              };

              focusedWorkspace = {
                background = colors.base02;
                border = colors.base02;
                text = colors.base04;
              };

              inactiveWorkspace = {
                background = colors.base01;
                border = colors.base01;
                text = colors.base03;
              };

              urgentWorkspace = {
                background = colors.base08;
                border = colors.base01;
                text = colors.base00;
              };
            };
          };
        };
      };
  };
}

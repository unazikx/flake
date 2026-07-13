{
  ...
}:

{
  zen.programs.desktop.wleave = {
    description = ''
      best actions for system management
    '';

    homeManager =
      {
        lib,
        config,
        ...
      }:
      {
        programs.wleave = {
          enable = true;

          settings = {
            margin = 200;
            buttons-per-row = toString 2;

            column-spacing = 32;
            row-spacing = 32;

            show-keybinds = false;
            no-version-info = true;

            buttons =
              let
                button = name: action: keybind: {
                  inherit action keybind;
                  label = name;
                  text = name;
                  icon = lib.concatStringsSep "/" [
                    (toString config.programs.wleave.package)
                    "share"
                    "wleave"
                    "icons"
                    "${name}.svg"
                  ];
                };
              in
              [
                (button "shutdown" "systemctl poweroff" "s")
                (button "reboot" "systemctl reboot" "r")
                (button "suspend" "systemctl suspend" "u")
                (button "logout" "loginctl terminate-user $USER" "e")
              ];
          };

          style =
            let
              colors = config.lib.stylix.colors.withHashtag;
            in
            ''
              * {
                font-family: "${config.stylix.fonts.sansSerif.name}";
                font-size: ${toString config.stylix.fonts.sizes.desktop}pt;
                background-image: none;
              }

              window { background-color: ${colors.base00}; }

              button {
                background-color: ${colors.base01};
                color: oklab(from var(--view-fg-color) var(--standalone-color-oklab));
                border-radius: 30px;
              }

              button:focus, button:hover {
                background-color: ${colors.base02};
              }

              button:active {
                color: var(--accent-fg-color);
                background-color: var(--accent-bg-color);
              }
            ''
            + (lib.concatStringsSep "\n" (
              map
                (item: ''
                  button#${item.name} {
                    --view-fg-color: ${item.color};
                  }
                '')
                [
                  {
                    name = "shutdown";
                    color = colors.base08;
                  }

                  {
                    name = "reboot";
                    color = colors.base0A;
                  }

                  {
                    name = "suspend";
                    color = colors.base0C;
                  }

                  {
                    name = "logout";
                    color = colors.base0E;
                  }
                ]
            ));
        };
      };
  };
}

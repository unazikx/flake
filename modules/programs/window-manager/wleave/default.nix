# INFO:
# best actions for system management

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        {
          hm.programs.wleave = {
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
                  button =
                    name: action: keybind:
                    {
                      inherit action keybind;
                      icon = lib.concatStringsSep "/" [
                        (toString config.hm.programs.wleave.package)
                        "share"
                        "wleave"
                        "icons"
                        "${name}.svg"
                      ];
                    }
                    // (lib.genAttrs [
                      "label"
                      "text"
                    ] (_: name));
                in
                [
                  (button "shutdown" "systemctl poweroff" "s")
                  (button "reboot" "systemctl reboot" "r")
                  (button "suspend" "systemctl suspend" "u")
                  (button "logout" "loginctl terminate-user $USER" "e")
                ];
            };

            style =
              with config.lib.stylix.colors.withHashtag;
              ''
                * {
                  font-family: "${config.stylix.fonts.sansSerif.name}";
                  font-size: ${toString config.stylix.fonts.sizes.desktop}pt;
                  background-image: none;
                }

                window { background-color: ${base00}; }

                button {
                  background-color: ${base01};
                  color: oklab(from var(--view-fg-color) var(--standalone-color-oklab));
                  border-radius: 30px;
                }

                button:focus, button:hover {
                  background-color: ${base02};
                }

                button:active {
                  color: var(--accent-fg-color);
                  background-color: var(--accent-bg-color);
                }
              ''
              + (lib.concatStringsSep "\n" (
                map
                  (n: ''
                    button#${n.name} { --view-fg-color: ${n.color}; }
                  '')
                  [
                    {
                      name = "shutdown";
                      color = base08;
                    }

                    {
                      name = "reboot";
                      color = base0A;
                    }

                    {
                      name = "suspend";
                      color = base0C;
                    }

                    {
                      name = "logout";
                      color = base0E;
                    }
                  ]
              ));
          };
        };
    };
}

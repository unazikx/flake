# WARN:
# use wleave pls

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
          hm.programs.wlogout = {
            enable = true;

            layout = [
              {
                label = "shutdown";
                action = "systemctl poweroff";
                text = "Shutdown";
                keybind = "s";
              }
              {
                label = "reboot";
                action = "systemctl reboot";
                text = "Reboot";
                keybind = "r";
              }
              {
                label = "suspend";
                action = "systemctl suspend";
                text = "Suspend";
                keybind = "u";
              }
              {
                label = "hibernate";
                action = "systemctl hibernate";
                text = "Hibernate";
                keybind = "h";
              }
              {
                label = "lock";
                action = "loginctl lock-session";
                text = "Lock";
                keybind = "l";
              }
              {
                label = "logout";
                action = "loginctl terminate-user $USER";
                text = "Logout";
                keybind = "e";
              }
            ];

            style = with config.lib.stylix.colors.withHashtag; ''
              * {	background-image: none; box-shadow: none; }

              window { background-color: ${base00}; }

              button {
                border-radius: 10;
                border-color: ${base0E};
              	text-decoration-color: ${base04};
                color: ${base05};
              	background-color: ${base00};
              	border-style: solid;
              	background-repeat: no-repeat;
              	background-position: center;
              	background-size: 25%;
              }

              button:focus,
              button:active,
              button:hover { background-color: ${base01}; outline-style: none; }
              ${lib.concatMapStringsSep "\n"
                (n: ''
                  #${n} {
                    background-image: image(url("${config.hm.programs.wlogout.package}/share/wlogout/icons/${n}.png"));
                  }
                '')
                [
                  "lock"
                  "logout"
                  "suspend"
                  "hibernate"
                  "shutdown"
                  "reboot"
                ]
              }
            '';
          };
        };
    };
}

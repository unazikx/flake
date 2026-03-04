# INFO:
# tui for discrord
# very simple

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        let
          toml = pkgs.formats.toml { };
        in
        {
          hmPackages = [ pkgs.discordo ];

          hm.xdg.configFile = {
            "discordo/config.toml".source = toml.generate "discordo-config.toml" {
              mouse = false;
              status = "online";
              notifications.enabled = true;

              markdown = true;
              hide_blocked_users = true;
              show_attachment_links = true;

              timestamps = {
                enabled = true;
                format = "2006-01-02 15:04:05";
              };

              keys = {
                focus_guilds_tree = "Ctrl-A";
                focus_message_input = "Ctrl+Space";
                focus_messages_list = "Ctrl+S";
                toggle_guilds_tree = "Ctrl+W";

                quit = "Ctrl+C";
                logout = "Ctrl+D";

                mentions_list = {
                  up = "Ctrl+K";
                  down = "Ctrl+J";
                };
              };

              theme = {
                title.alignment = "center";

                active_style = {
                  foreground = "cyan";
                  attributes = "bold";
                };

                border = {
                  enabled = true;

                  normal_style = {
                    attributes = "dim";
                  };

                  active_style = {
                    foreground = "white";
                    attributes = "bold";
                  };
                };

                messages_list = {
                  reply_indicator = "»";
                  forwarded_indicator = "«";
                };
              };
            };
          };

          environment.interactiveShellInit =
            # bash
            ''
              export DISCORDO_TOKEN="$(cat ${config.sopsnix."tokens/discord"})"
            '';
        };
    };
}

{
  ...
}:

{
  zen.programs.gui.qutebrowser.settings = {
    homeManager =
      {
        ...
      }:
      {
        programs.qutebrowser = {
          settings = {
            completion.height = "75%";

            downloads = {
              position = "bottom";
              location.remember = true;
            };

            confirm_quit = [ "downloads" ];

            scrolling = {
              bar = "overlay";
              smooth = false;
            };

            statusbar = {
              show = "in-mode";

              widgets = [
                "keypress"
                "search_match"
                "url"
                "tabs"
                "progress"
                "scroll"
              ];
            };

            tabs = {
              show = "multiple";
              position = "top";
              tooltips = false;
              show_switching_delay = 500;

              title = {
                format = "[{index}] {current_title}";
                format_pinned = "";
              };
            };

            content = {
              register_protocol_handler = false;

              blocking = {
                enabled = true;
                method = "both";

                whitelist = [
                  "thepiratebay.org"
                  "trueachievements.com"
                ];
              };

              pdfjs = true;
              javascript.clipboard = "access";
            };

            hints = {
              scatter = false;
              chars = "asdfghjkl";
            };

            editor.command = [
              "footclient"
              "hx"
              "{file}:{line}:{column0}"
            ];

            fileselect = {
              handler = "external";

              single_file.command = [
                "footclient"
                "yazi"
                "--chooser-file"
                "{}"
              ];

              multiple_files.command = [
                "footclient"
                "yazi"
                "--chooser-file"
                "{}"
              ];

              folder.command = [
                "footclient"
                "yazi"
                "--chooser-file"
                "{}"
              ];
            };
          };

          extraConfig = # python
            ''
              config.unbind('.')

              en_keys = "qwertyuiop[]asdfghjkl;'zxcvbnm,./"+'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?'
              ru_keys = 'йцукенгшщзхъфывапролджэячсмитьбю.'+'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДжЭЯЧСМИТЬБЮ,'
              for key in ru_keys:
                  c.bindings.key_mappings[key]=en_keys[ru_keys.index(key)]

              c.content.javascript.log_message.excludes = {
                  "userscript:_qute_stylesheet": [ "*Refused to apply inline style because it violates the following Content Security Policy directive: *" ],
                  "userscript:_qute_js": [ "*TrustedHTML*" ]
              }
            '';

          perDomainSettings."accounts.google.com".content.headers.user_agent =
            "Mozilla/5.0 ({os_info}; rv:135.0) Gecko/20100101 Firefox/135";
        };
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      let
        glanceCfg = osConfig.services.glance;
        page =
          if glanceCfg.enable then
            (lib.concatStringsSep ":" [
              glanceCfg.settings.server.host
              (toString glanceCfg.settings.server.port)
            ])
          else
            "qute://start";
      in
      {
        programs.qutebrowser = {
          settings.url = {
            start_pages = page;
            default_page = page;
          };
        };
      };
  };
}

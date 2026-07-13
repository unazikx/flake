{
  ...
}:

{
  zen.programs.editors.opencode.oh-my-opencode = {
    homeManager =
      {
        pkgs,
        ...
      }:
      let
        json = pkgs.formats.json { };
      in
      {
        programs.opencode = {
          settings = {
            plugin = [ "oh-my-opencode-slim@2.1.0" ];

            agent = {
              build.disable = true;
              explore.disable = true;
              general.disable = true;
              plan.disable = true;
            };
          };

          tui.plugin = [
            "oh-my-opencode-slim@2.1.0"
          ];
        };

        xdg.configFile."opencode/oh-my-opencode-slim.json" = {
          force = true;
          source = json.generate "oh-my-opencode-slim.json" {
            "$schema" = "https://unpkg.com/oh-my-opencode-slim@latest/oh-my-opencode-slim.schema.json";

            autoUpdate = false;
            showStartupToast = false;

            preset = "main";

            presets = {
              opencode-zen-free = {
                orchestrator = {
                  model = "opencode/hy3-free";
                  temperature = 0.4;
                  skills = [ "*" ];
                  mcps = [
                    "*"
                    "!context7"
                  ];
                };

                oracle = {
                  model = "opencode/big-pickle";
                  temperature = 0.4;
                  variant = "max";
                  skills = [ "simplify" ];
                  mcps = [ ];
                };

                explorer = {
                  model = "opencode/north-mini-code-free";
                  temperature = 0.2;
                  skills = [ ];
                  mcps = [ ];
                };

                librarian = {
                  model = "opencode/deepseek-v4-flash-free";
                  temperature = 0.2;
                  skills = [ ];
                  mcps = [
                    "websearch"
                    "context7"
                    "gh_grep"
                  ];
                };

                designer = {
                  model = "opencode/mimo-v2.5-free";
                  temperature = 0.3;
                  variant = "medium";
                  skills = [ ];
                  mcps = [ ];
                };

                fixer = {
                  model = "opencode/deepseek-v4-flash-free";
                  temperature = 0.2;
                  variant = "high";
                  skills = [ ];
                  mcps = [ ];
                };

                observer = {
                  model = "opencode/mimo-v2.5-free";
                  temperature = 0.2;
                  variant = "low";
                  skills = [ ];
                  mcps = [ ];
                };
              };
            };

            disabled_mcps = [ "context7" ];
          };
        };
      };
  };
}

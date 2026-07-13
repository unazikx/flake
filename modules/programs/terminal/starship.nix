{
  ...
}:

{
  zen.programs.terminal.starship = {
    description = ''
      best the most customizable prompt

      nixzoid in /nix [󰌾] 3s
      ❯ 
    '';

    homeManager =
      {
        lib,
        ...
      }:
      {
        programs.starship = {
          enable = true;
          enableTransience = true;

          settings = {
            add_newline = true;

            right_format = "$battery";

            format = lib.concatStrings [
              "$username"
              "$directory"
              "$git_branch"
              "$cmd_duration"
              "$line_break"
              "$character"
            ];

            username = {
              format = "[$user]($style) in ";
              style_root = "bold red";
              style_user = "bold purple";

              show_always = true;
            };

            directory = {
              format = "[$path]($style) [$read_only]($read_only_style)";
              style = "bold fg:blue";

              read_only = "[󰌾] ";
              read_only_style = "bold red";
              home_symbol = "home";

              truncation_length = 1;
              truncation_symbol = "../";
            };

            git_branch = {
              format = "on [$symbol$branch]($style) ";
              style = "bold italic fg:green";

              symbol = " ";

              truncation_length = 24;
              truncation_symbol = "";
            };

            git_metrics = {
              format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
              added_style = "bold fg:green";
              deleted_style = "bold fg:red";
            };

            cmd_duration = {
              format = "[$duration](bold fg:yellow)";

              min_time = 1000;
            };

            character = {
              format = "$symbol ";

              success_symbol = "[❯](bold green)";
              error_symbol = "[✗](bold red)";

              vimcmd_symbol = "[N](bold blue)";
              vimcmd_replace_one_symbol = "[R](bold purple)";
              vimcmd_replace_symbol = "[R](bold purple)";
              vimcmd_visual_symbol = "[V](bold yellow)";
            };

            battery = {
              format = "[$symbol $percentage]($style)";

              full_symbol = "󰁹";
              unknown_symbol = "󰁽";
              empty_symbol = "󰂎";
              charging_symbol = "󰂄";
              discharging_symbol = "󰂃";

              display = [
                {
                  threshold = 25;
                  style = "bold red";
                }
              ];
            };
          };
        };
      };
  };
}

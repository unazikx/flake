{
  ...
}:

{
  zen.programs.editors.helix.theme = {
    homeManager =
      {
        config,
        ...
      }:
      {
        programs.helix = {
          settings.theme = "base16-stylix";

          themes.base16-stylix =
            let
              colors = config.lib.stylix.colors.withHashtag;
            in
            {
              # keep-sorted start block=yes
              "attributes" = colors.base09;
              "comment" = {
                fg = colors.base03;
                modifiers = [ "italic" ];
              };
              "constant" = colors.base09;
              "constant.character.escape" = colors.base0C;
              "constant.numeric" = colors.base09;
              "constructor" = colors.base0D;
              "debug" = colors.base03;
              "diagnostic" = {
                modifiers = [ "underlined" ];
              };
              "diagnostic.error" = {
                underline = {
                  style = "curl";
                };
              };
              "diagnostic.hint" = {
                underline = {
                  style = "curl";
                };
              };
              "diagnostic.info" = {
                underline = {
                  style = "curl";
                };
              };
              "diagnostic.warning" = {
                underline = {
                  style = "curl";
                };
              };
              "diff.delta" = colors.base09;
              "diff.minus" = colors.base08;
              "diff.plus" = colors.base0B;
              "error" = colors.base08;
              "function" = colors.base0D;
              "hint" = colors.base03;
              "info" = colors.base0D;
              "keyword" = colors.base0E;
              "label" = colors.base0E;
              "markup.bold" = {
                fg = colors.base0A;
                modifiers = [ "bold" ];
              };
              "markup.heading" = colors.base0D;
              "markup.italic" = {
                fg = colors.base0E;
                modifiers = [ "italic" ];
              };
              "markup.link.text" = colors.base08;
              "markup.link.url" = {
                fg = colors.base09;
                modifiers = [
                  "underlined"
                  "italic"
                ];
              };
              "markup.list" = colors.base08;
              "markup.quote" = colors.base0C;
              "markup.raw" = colors.base0B;
              "markup.strikethrough" = {
                modifiers = [ "crossed_out" ];
              };
              "namespace" = colors.base0E;
              "operator" = colors.base05;
              "special" = colors.base0D;
              "string" = colors.base0B;
              "type" = colors.base0A;
              "ui.background" = {
                fg = colors.base04;
                bg = colors.base00;
              };
              "ui.bufferline" = {
                fg = colors.base04;
                bg = colors.base00;
              };
              "ui.bufferline.active" = {
                fg = colors.base04;
                bg = colors.base02;
                modifiers = [ "bold" ];
              };
              "ui.bufferline.separator" = {
                fg = colors.base00;
                bg = colors.base01;
              };
              "ui.cursor" = {
                fg = colors.base0A;
                modifiers = [ "reversed" ];
              };
              "ui.cursor.insert" = {
                fg = colors.base0A;
                modifiers = [ "reversed" ];
              };
              "ui.cursor.match" = {
                fg = colors.base0A;
                modifiers = [ "reversed" ];
              };
              "ui.cursor.select" = {
                fg = colors.base0A;
                modifiers = [ "reversed" ];
              };
              "ui.cursorline.primary" = {
                fg = colors.base05;
                bg = colors.base01;
              };
              "ui.gutter" = {
                bg = colors.base00;
              };
              "ui.help" = {
                fg = colors.base04;
                bg = colors.base01;
              };
              "ui.linenr" = {
                fg = colors.base03;
                bg = colors.base00;
              };
              "ui.linenr.selected" = {
                fg = colors.base04;
                bg = colors.base01;
                modifiers = [ "bold" ];
              };
              "ui.menu" = {
                fg = colors.base05;
                bg = colors.base01;
              };
              "ui.menu.scroll" = {
                fg = colors.base03;
                bg = colors.base01;
              };
              "ui.menu.selected" = {
                fg = colors.base01;
                bg = colors.base04;
              };
              "ui.popup" = {
                bg = colors.base01;
              };
              "ui.selection" = {
                bg = colors.base02;
              };
              "ui.selection.primary" = {
                bg = colors.base02;
              };
              "ui.statusline" = {
                fg = colors.base04;
                bg = colors.base01;
              };
              "ui.statusline.inactive" = {
                bg = colors.base01;
                fg = colors.base03;
                modifiers = [ "bold" ];
              };
              "ui.statusline.insert" = {
                fg = colors.base00;
                bg = colors.base0B;
                modifiers = [ "bold" ];
              };
              "ui.statusline.normal" = {
                fg = colors.base05;
                bg = colors.base02;
                modifiers = [ "bold" ];
              };
              "ui.statusline.select" = {
                fg = colors.base00;
                bg = colors.base0A;
                modifiers = [ "bold" ];
              };
              "ui.text" = colors.base05;
              "ui.text.focus" = colors.base05;
              "ui.virtual.indent-guide" = {
                fg = colors.base02;
              };
              "ui.virtual.inlay-hint" = {
                fg = colors.base02;
              };
              "ui.virtual.jump-label" = {
                fg = colors.base0A;
                modifiers = [ "bold" ];
              };
              "ui.virtual.ruler" = {
                bg = colors.base01;
              };
              "ui.virtual.wrap" = {
                fg = colors.base02;
              };
              "ui.window" = {
                bg = colors.base01;
                fg = colors.base04;
              };
              "variable" = colors.base08;
              "variable.other.member" = colors.base0B;
              "warning" = colors.base09;
              # keep-sorted end
            };
        };
      };
  };
}

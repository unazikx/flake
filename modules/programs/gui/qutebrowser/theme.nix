{
  ...
}:

{
  zen.programs.gui.qutebrowser.theme = {
    homeManager =
      {
        config,
        lib,
        ...
      }:
      {
        programs.qutebrowser.settings.colors =
          let
            colors = config.lib.stylix.colors.withHashtag;
          in
          {
            tabs = {
              odd.fg = lib.mkForce colors.base03;

              even = {
                bg = lib.mkForce colors.base00;
                fg = lib.mkForce colors.base03;
              };

              selected = {
                even.bg = lib.mkForce colors.base02;
                odd.bg = lib.mkForce colors.base02;
              };

              pinned = {
                even.bg = lib.mkForce colors.base00;
                odd.bg = lib.mkForce colors.base00;

                selected = {
                  even.bg = lib.mkForce colors.base02;
                  odd.bg = lib.mkForce colors.base02;
                };
              };
            };

            hints = {
              bg = lib.mkForce colors.base00;
              fg = lib.mkForce colors.base04;
              match.fg = lib.mkForce colors.base08;
            };

            webpage = {
              preferred_color_scheme = "dark";
              darkmode.enabled = true;
            };
          };
      };
  };
}

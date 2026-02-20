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
        let
          cfg = config.stylix;
        in
        {
          hm.services.dunst = {
            enable = true;

            iconTheme.size = "64x64";

            settings = {
              global = {
                width = 400;
                corner_radius = 12;

                alignment = "left";
                format = "<b>[%a]</b>\\n<b>%s</b>\\n%b";
                vertical_alignment = "top";
                notification_limit = 4;

                origin = "top-right";
                offset = lib.concatStringsSep "x" [
                  "10"
                  "10"
                ];

                icon_path =
                  lib.concatMapStringsSep ":"
                    (
                      category:
                      "${cfg.icons.package}/share/icons/${
                        if (cfg.polarity == "dark") then cfg.icons.dark else cfg.icons.light
                      }/${config.hm.services.dunst.iconTheme.size}/${category}"
                    )
                    [
                      "actions"
                      "apps"
                      "categories"
                      "devices"
                      "emblems"
                      "emotes"
                      "mimetypes"
                      "places"
                      "status"
                      "symbolic"
                    ];
              };

              urgency_low.timeout = 3;

              urgency_normal = {
                timeout = 5;
                frame_color = lib.mkForce config.lib.stylix.colors.withHashtag.base04;
              };

              urgency_critical.timeout = 0;
            };
          };
        };
    };
}

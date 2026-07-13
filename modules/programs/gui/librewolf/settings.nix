{
  ...
}:

{
  zen.programs.gui.librewolf.settings = {
    homeManager =
      {
        user,
        ...
      }:
      {
        programs.librewolf = {
          profiles.${user.userName} = {
            settings = {
              # keep-sorted start
              "app.normandy.first_run" = false;
              "browser.display.use_system_colors" = true;
              "browser.ml.linkPreview.collapsed" = true;
              "browser.ml.linkPreview.enabled" = true;
              "browser.ml.linkPreview.shift" = true;
              "browser.tabs.groups.enabled" = false;
              "browser.tabs.hoverPreview.enabled" = true;
              "browser.tabs.hoverPreview.showThumbnails" = false;
              "browser.tabs.inTitlebar" = 0;
              "browser.translations.enable" = false;
              "browser.uidensity" = 2;
              "browser.uitour.enabled" = false;
              "browser.urlbar.suggest.addons" = false;
              "browser.urlbar.suggest.amp" = false;
              "browser.urlbar.suggest.bookmark" = false;
              "browser.urlbar.suggest.calculator" = false;
              "browser.urlbar.suggest.clipboard" = false;
              "browser.urlbar.suggest.engines" = false;
              "browser.urlbar.suggest.history" = true;
              "browser.urlbar.suggest.importantDates" = false;
              "browser.urlbar.suggest.mdn" = false;
              "browser.urlbar.suggest.openpage" = false;
              "browser.urlbar.suggest.quickactions" = false;
              "browser.urlbar.suggest.realtimeOptIn" = false;
              "browser.urlbar.suggest.recentsearches" = false;
              "browser.urlbar.suggest.remotetab" = false;
              "browser.urlbar.suggest.searches" = false;
              "browser.urlbar.suggest.sports" = false;
              "browser.urlbar.suggest.topsites" = false;
              "browser.urlbar.suggest.trending" = false;
              "browser.urlbar.suggest.weather" = false;
              "browser.urlbar.suggest.wikipedia" = false;
              "browser.urlbar.suggest.yelp" = false;
              "extensions.autoDisableScopes" = 0;
              "extensions.update.autoUpdateDefault" = false;
              "extensions.update.enabled" = false;
              "gfx.webrender.all" = true;
              "layers.acceleration.force-enabled" = true;
              "middlemouse.paste" = false;
              "mousebutton.4th.enabled" = false;
              "mousebutton.5th.enabled" = false;
              "narrate.enabled" = false;
              "network.proxy.type" = 0;
              "privacy.userContext.enabled" = false;
              "reader.content_width" = 5;
              "reader.text_alignment" = "justify";
              "svg.context-properties.content.enabled" = true;
              "ui.key.menuAccessKeyFocuses" = false;
              # keep-sorted end
            };
          };
        };
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        user,
        ...
      }:
      let
        glanceCfg = osConfig.services.glance;
      in
      {
        programs.librewolf = {
          profiles.${user.userName}.settings = {
            "browser.startup.homepage" =
              if glanceCfg.enable then
                (lib.concatStringsSep ":" [
                  glanceCfg.settings.server.host
                  (toString glanceCfg.settings.server.port)
                ])
              else
                "about:home";
          };
        };
      };
  };
}

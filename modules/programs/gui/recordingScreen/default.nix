# INFO:
# set theme in settings
# ...
# with wf-recorded

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        let
          inherit (config.hm.xdg.userDirs)
            videos
            ;

          savePath = videos + "/videocasts";

          obsTheme = import ./obs-theme.nix {
            inherit config;
          };
        in
        {
          persist.user.directories = [ ".config/obs-studio" ];

          hmPackages = [ pkgs.wf-recorder ];

          hm = {
            programs.obs-studio = {
              enable = true;

              plugins = lib.attrValues {
                inherit (pkgs.obs-studio-plugins)
                  input-overlay
                  obs-backgroundremoval
                  obs-multi-rtmp
                  obs-pipewire-audio-capture
                  obs-vaapi
                  obs-vkcapture
                  wlrobs
                  ;
              };
            };

            xdg.configFile = {
              "obs-studio/themes/stylix.obt".text = obsTheme.obt;
              "obs-studio/themes/stylix.ovt".text = obsTheme.ovt;
            };
          };

          tmp.wf-rec = {
            "${savePath}/"."d" = {
              user = lib.userName;
              group = "users";

              mode = "0775";
            };
          };
        };
    };
}

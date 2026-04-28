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
          savePath = "${config.hm.xdg.userDirs.videos}/videocasts";

          obsTheme = import ./obs-theme.nix {
            inherit config;
          };
        in
        {
          persist.user.directories = [
            ".config/obs-studio"
          ];

          hmPackages = [
            pkgs.wf-recorder
          ];

          programs.droidcam.enable = true;

          hm = {
            programs.obs-studio = {
              enable = true;

              plugins = lib.attrValues {
                inherit (pkgs.obs-studio-plugins)
                  # keep-sorted start
                  input-overlay
                  obs-backgroundremoval
                  droidcam-obs
                  obs-multi-rtmp
                  obs-pipewire-audio-capture
                  obs-vaapi
                  obs-vkcapture
                  wlrobs
                  # keep-sorted end
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

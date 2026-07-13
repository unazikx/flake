{
  ...
}:

{
  zen.programs.gui.obs-studio = {
    description = ''
      stream and record ur screen
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.obs-studio = {
          enable = true;

          plugins = [
            # keep-sorted start
            pkgs.obs-studio-plugins.droidcam-obs
            pkgs.obs-studio-plugins.input-overlay
            pkgs.obs-studio-plugins.obs-backgroundremoval
            pkgs.obs-studio-plugins.obs-multi-rtmp
            pkgs.obs-studio-plugins.obs-pipewire-audio-capture
            pkgs.obs-studio-plugins.obs-vaapi
            pkgs.obs-studio-plugins.obs-vkcapture
            pkgs.obs-studio-plugins.wlrobs
            # keep-sorted end
          ];
        };
      };
  };
}

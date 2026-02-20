{
  pkgs,
  lib,
  ...
}:

let
  mkShader = "no-osd change-list glsl-shaders";
  anime4k = import ./anime4k.nix {
    inherit mkShader pkgs;
  };
in

{
  script = {
    sponsorblock-minimal = {
      sponsorblock_minimal-server = "https://sponsor.ajay.app/api/skipSegments";

      sponsorblock_minimal-categories = [
        "selfpromo"
        "sponsor"
      ];
    };

    mpv_thumbnail_script = {
      autogenerate = "yes";
      autogenerate_max_duration = "3600";

      background_color = "000000";
      mpv_no_sub = "no";
      prefer_mpv = "yes";

      thumbnail_count = 150;
      thumbnail_height = 200;
      thumbnail_network = "no";
      thumbnail_width = 200;
    };
  };

  config = {
    fs = "yes";
    osc = "yes";

    glsl-shaders = toString (
      if (lib.configurationName == "pcRyazenka") then (anime4k.desktopAutoStart) else null
    );

    ytdl-format = "bestvideo[height<=?1080][fps<=?60]+bestaudio/best";

    osd-blur = 0.2;
  };

  extra = ''
    ${
      if (lib.configurationName == "thinkpadT14") then
        (anime4k.laptop)
      else if (lib.configurationName == "pcRyazenka") then
        (anime4k.desktop)
      else
        (toString null)
    }

    # fsr
    CTRL+7 ${mkShader} set "${pkgs.mpv-shim-default-shaders}/share/mpv-shim-default-shaders/shaders/FSR.glsl"; show-text "FSR enabled"

    CTRL+0 ${mkShader} clr ""; show-text "GLSL shaders cleared"
  '';
}

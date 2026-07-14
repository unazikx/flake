{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    binternet-nix = {
      type = "github";
      owner = "unazikx";
      repo = "binternet-nix";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };

  zen.services.binternet = {
    description = ''
      opensource fronrend for pinerest
    '';

    nixos =
      {
        pkgs,
        config,
        ...
      }:
      {
        services.binternet = {
          enable = true;

          package =
            # INFO:
            # override only for theming
            let
              colors = config.lib.stylix.colors.withHashtag;
              fonts = config.stylix.fonts;
            in
            pkgs.binternet.overrideAttrs (_old: {
              fixupPhase = ''
                substituteInPlace $out/misc/style-dark.css \
                  --replace-fail \
                    '--accent-color: #12e8b9;' '--accent-color: ${colors.base0E};' \
                  --replace-fail \
                    '--fg-color: white;' '--fg-color: ${colors.base05};' \
                  --replace-fail \
                    '--border-color: rgb(97, 97, 97);' '--border-color: ${colors.base02};' \
                  --replace-fail \
                    '--main: #2a2b2b;' '--main: ${colors.base00};' \
                  --replace-fail \
                    '--main-second: #1f2120;' '--main-second: ${colors.base01};' \
                  --replace-fail \
                    'font-family: verdana, arial, sans-serif;' 'font-family: ${fonts.sansSerif.name};'
              '';
            });
        };
      };
  };
}

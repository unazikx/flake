{
  ...
}:

{
  zen.programs.cli.rusted-tools = {
    description = ''
      export shell variables for tokens
      alias for repl and rebuild
      nurl -> prefetch repos and other
    '';

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        environment = {
          systemPackages = [
            # keep-sorted start
            pkgs.hunt
            pkgs.jq
            pkgs.ouch
            pkgs.ripgrep-all
            pkgs.sd
            # keep-sorted end

            # WARN:
            # watafaq is this???
            #
            # ❯ diff --version
            # Unknown option: "--version"
            # ❯ diff -r BeyondSunset_1.0.1 BeyondSunset_1.0.1X
            # Unknown option: "-r"
            # ❯ diff BeyondSunset_1.0.1 BeyondSunset_1.0.1X -r
            # Unknown option: "-r"
          ];

          shellAliases = {
            cp = lib.getExe' pkgs.fuc "cpz";
          };
        };
      };

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        home.shellAliases = {
          cat = lib.mkIf (config.programs.bat.enable) "bat";
        };

        programs = {
          ripgrep.enable = true;

          fd = {
            enable = true;

            ignores = [
              ".git/"
              "*.bak"
            ];
          };

          fzf = {
            enable = true;

            defaultOptions = [
              "--border=rounded"
              "--info=hidden"
              "--no-mouse"
              "--margin=5%"
              "--padding=3%"
            ];
          };

          eza = {
            enable = true;

            icons = "auto";

            extraOptions = [
              "--group-directories-first"
              "--icons=always"
            ];
          };

          bat = {
            enable = true;

            extraPackages = [
              pkgs.bat-extras.prettybat
              pkgs.bat-extras.batwatch
              pkgs.bat-extras.batgrep
              pkgs.bat-extras.batdiff
            ];

            config.wrap = "character";
          };
        };
      };
  };
}

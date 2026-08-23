{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    xmcl = {
      type = "github";
      owner = "x45iq";
      repo = "xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.minecraft.xmcl = {
    description = ''
      another launcher for minecraft
    '';

    includes = [
      zen.custom.xmcl
    ];

    homeManager =
      {
        inputs,
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
        fonts = config.stylix.fonts;
      in
      {
        imports = [
          inputs.xmcl.homeModules.xmcl
        ];

        programs.xmcl = {
          enable = true;

          jres = zen.games.minecraft.meta.temurinJRE pkgs;

          settings = {
            # keep-sorted start block=yes
            agentEndpoint = "";
            agentModel = "";
            allowPrerelease = false;
            allowTurn = false;
            apiSetsPreference = "";
            autoDownload = false;
            autoInstallOnAppQuit = false;
            developerMode = false;
            disableTelemetry = true;
            discordPresence = config.programs.nixcord.enable;
            enableDedicatedGPUOptimization = true;
            globalAssignMemory = true;
            globalDisableAuthlibInjector = false;
            globalDisableElyByAuthlib = false;
            globalEnv = { };
            globalFastLaunch = false;
            globalHideLauncher = true;
            globalJava = lib.getExe (zen.games.minecraft.meta.defaultJRE pkgs);
            globalMaxMemory = 8192;
            globalMcOptions = [ ];
            globalMinMemory = 256;
            globalPreExecuteCommand = "";
            globalPrependCommand = "";
            globalShowLog = false;
            globalVmOptions = [ ];
            httpProxy = "";
            httpProxyEnabled = false;
            linuxTitlebar = true;
            locale = "en";
            maxAPISockets = 16;
            maxSockets = 64;
            replaceNatives = "legacy-only";
            windowTranslucent = false;
            # keep-sorted end
          };

          theme = {
            colors = {
              # keep-sorted start block=yes
              assets.backgroundMusic = [ ];
              settings = {
                backgroundColorOverlay = true;
                backgroundMusicPlayOrder = "sequential";
                backgroundVolume = 1;
                blur = 3;
                fontSize = fonts.sizes.applications + 2;
                blurAppBar = 3;
                blurCard = 20;
                blurSidebar = 3;
                borderRadiusEnabled = true;
              };
              ui = "keystone";
              version = 1;
              # keep-sorted end
            };

            css =
              # css
              ''
                .v-system-bar {
                  display: none
                }
              '';

            background = lib.stylix.mkImage pkgs (pkgs.fetchurl {
              url = "https://w.wallhaven.cc/full/l8/wallhaven-l8qq3l.png";
              sha256 = "sha256-M6bRjpDNR3TClnEyd4WlQtuONkB0JHFZ2x7t3MLRhFE=";
            }) colors.toList;
          };
        };
      };
  };
}

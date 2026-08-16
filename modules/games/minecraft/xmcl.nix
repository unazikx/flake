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
        config,
        ...
      }:
      {
        imports = [
          inputs.xmcl.homeModules.xmcl
        ];

        programs.xmcl = {
          enable = true;

          jres = zen.games.minecraft.meta.temurinJRE pkgs;

          settings = {
            # keep-sorted start block=yes
            locale = "en";
            autoDownload = false;
            autoInstallOnAppQuit = false;
            allowPrerelease = false;
            apiSetsPreference = "";
            allowTurn = false;
            httpProxy = "";
            httpProxyEnabled = false;
            theme = "system";
            maxSockets = 64;
            maxAPISockets = 16;
            replaceNatives = "legacy-only";
            globalMinMemory = 256;
            globalMaxMemory = 8192;
            globalAssignMemory = true;
            globalJava = "";
            globalVmOptions = [ ];
            globalMcOptions = [ ];
            globalFastLaunch = false;
            globalHideLauncher = true;
            globalShowLog = false;
            globalDisableAuthlibInjector = false;
            globalDisableElyByAuthlib = false;
            globalPrependCommand = "";
            globalPreExecuteCommand = "";
            globalEnv = { };
            discordPresence = config.programs.nixcord.enable;
            developerMode = false;
            disableTelemetry = true;
            agentEndpoint = "";
            agentModel = "";
            linuxTitlebar = true;
            enableDedicatedGPUOptimization = true;
            windowTranslucent = false;
            # keep-sorted end
          };
        };
      };
  };
}

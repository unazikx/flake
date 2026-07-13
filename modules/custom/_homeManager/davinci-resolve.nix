{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.davinci-resolve;

  crackedPackage =
    let
      drv = pkgs.davinci-resolve-studio.override (_prev: {
        buildFHSEnv =
          _old:
          (_prev.buildFHSEnv (
            _old
            // {
              extraBwrapArgs = lib.filter (n: !(lib.strings.hasInfix "license" n)) _old.extraBwrapArgs;
            }
          ));
      });

      replacements = [
        rec {
          oldDependency = drv.passthru.davinci;
          newDependency = oldDependency.overrideAttrs (
            _final: _prev: {
              postFixup = ''
                ${_prev.postFixup}

                ${lib.concatStringsSep "\n" (
                  map (p: ''
                    ${lib.getExe pkgs.perl} -pi -e ${lib.escapeShellArg p} $out/bin/resolve
                  '') cfg.patches
                )}

                ${lib.optionalString (cfg.extraLines != null) cfg.extraLines}
              '';
            }
          );
        }
      ];
    in
    pkgs.replaceDependencies {
      inherit
        drv
        replacements
        ;
    };
in

{
  options = {
    programs.davinci-resolve = {
      enable = lib.mkEnableOption "DaVinci Resolve, the professional video editing and color grading application";

      package = lib.mkPackageOption pkgs "davinci-resolve" {
        nullable = true;
      };

      cracked = lib.mkEnableOption "apply DaVinci Resolve binary patches and generate a license file (requires `davinci-resolve-studio` as the package source)";

      patches = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = ''
          Perl substitution strings applied to the resolve binary.
          <https://rutracker.org/forum/viewtopic.php?t=6088055>
        '';
      };

      extraLines = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Additional shell commands appended to postFixup (e.g. license file generation).";
      };

      finalPackage = lib.mkOption {
        type = lib.types.nullOr lib.types.package;
        readOnly = true;
        description = "The final davinci-resolve package, with patches applied if cracked is enabled.";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      assertions = [
        {
          assertion = !cfg.cracked || (cfg.patches != [ ] && cfg.extraLines != null);
          message = "davinci-resolve: `cracked` requires non-empty `patches` and non-null `extraLines`";
        }
      ];

      programs.davinci-resolve.finalPackage = if cfg.cracked then crackedPackage else cfg.package;

      home.packages = lib.mkIf (cfg.finalPackage != null) [ cfg.finalPackage ];
    })
  ];
}

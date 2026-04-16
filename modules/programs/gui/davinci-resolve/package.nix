{
  pkgs,
  lib,
}:

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

            ${
              (
                patches:
                lib.concatStringsSep "\n" (
                  map (p: ''
                    ${lib.getExe pkgs.perl} -pi -e ${lib.escapeShellArg p} $out/bin/resolve
                  '') patches
                )
              )
              [
                ''s/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/''
                ''s/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/''
                ''s/\x41\xb6\x01\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/\x41\xb6\x00\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/''
              ]
            }

            echo -e "LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted\nhostid=ANY issuer=CGP customer=CGP issued=28-dec-2023\nakey=0000-0000-0000-0000 _ck=00 sig=\"00\"" > $out/.license/blackmagic.lic
          '';
        }
      );
    }
  ];
in

pkgs.replaceDependencies {
  inherit drv replacements;
}

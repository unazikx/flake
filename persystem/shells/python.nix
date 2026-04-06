{
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    {
      # idk devshells from numtide is shit
      make-shells.python = {
        shellHook = ''
          if command -v fish > /dev/null 2>&1; then
            exec fish
          fi
        '';

        packages = (
          lib.attrValues {
            inherit (pkgs)
              black
              ;

            python = pkgs.python314.withPackages (
              _pkgs:
              (lib.attrValues {
                inherit (_pkgs)
                  aiohttp
                  requests
                  ;
              })
            );
          }
        );
      };
    };
}

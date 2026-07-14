{
  ...
}:

{
  perSystem =
    {
      inputs',
      pkgs,
      ...
    }:
    {
      make-shells.python-testing = {
        shellHook = ''
          if command -v fish > /dev/null 2>&1; then
            exec fish
          fi
        '';

        packages = [
          (pkgs.python314.withPackages (ps: [
            # keep-sorted start
            inputs'.myown.legacyPackages.anicli-api
            inputs'.myown.legacyPackages.hdrezka-api
            ps.aiohttp
            ps.black
            ps.gql
            ps.requests
            # keep-sorted end
          ]))
        ];
      };
    };
}

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
      # idk devshells from numtide is shit
      make-shells.python = {
        shellHook = ''
          if command -v fish > /dev/null 2>&1; then
            exec fish
          fi
        '';

        packages = [
          (pkgs.python314.withPackages (ps: [
            # keep-sorted start
            inputs'.my-own-packages.legacyPackages.anicli-api
            inputs'.my-own-packages.legacyPackages.hdrezka-api
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

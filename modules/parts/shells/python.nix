{
  ...
}:

{
  perSystem =
    {
      self',
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
            ps.aiohttp
            ps.black
            ps.gql
            ps.requests
            self'.legacyPackages.ani-cli-ru.client
            # keep-sorted end
          ]))
        ];
      };
    };
}

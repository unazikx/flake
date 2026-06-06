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
        packages = [
          (pkgs.python314.withPackages (ps: [
            # keep-sorted start
            inputs'.custom-packages.legacyPackages.anicli-api
            inputs'.custom-packages.legacyPackages.hdrezka-api
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

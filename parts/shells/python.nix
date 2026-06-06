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
      devshells.python-testing = {
        name = "Python devshell";

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

        commands = [ ];

        devshell.motd = ''
           {45}Welcome to Python devshell.{reset}
            (mainly for testing various software)
          Enter 'menu' for general commands.
        '';
      };
    };
}

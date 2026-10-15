{
  zen,
  ...
}:

{
  zen.games.srr = {
    description = ''
      sonic racing game, based on srb2
    '';

    meta = {
      package = pkgs: pkgs.ringracers;
    };

    homeManagerNixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.games.srr.meta;
        game = meta.package pkgs;
      in
      [
        {
          home.packages = [ game ];
        }
        (
          {
            "Sonic Ring Racers" = {
              target = game;
            };
          }
          |> lib.optionalAttrs (user.hasAspect zen.games.steam)
          |> (nonSteamApps: {
            programs.steam.config.nonSteamApps = nonSteamApps;
          })
        )
      ]
      |> lib.mkMerge;
  };
}

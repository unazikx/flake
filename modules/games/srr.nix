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
      in
      (lib.mkMerge [
        {
          home.packages = [
            (meta.package pkgs)
          ];
        }
        (lib.optionalAttrs (user.hasAspect zen.games.steam) {
          programs.steam.config.nonSteamApps = {
            "Sonic Ring Racers" = {
              target = meta.package pkgs;
            };
          };
        })
      ]);
  };
}

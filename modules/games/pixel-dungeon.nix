{
  zen,
  ...
}:

{
  zen.games.shattered-pixel-dungeon = {
    description = ''
      shattered-pixel-dungeon game and forks
      i dont know whats better than other
    '';

    meta = {
      package = pkgs: pkgs.shattered-pixel-dungeon;
      # jre = pkgs: pkgs.temurin-jre-bin;
    };

    homeManagerNixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.games.shattered-pixel-dungeon.meta;
        # jre = meta.jre pkgs;

        # game = (meta.package pkgs).override {
        #   callPackage = pkgs.lib.callPackageWith (
        #     pkgs
        #     // {
        #       inherit jre;
        #     }
        #   );
        # };

        game = (meta.package pkgs);
      in
      [
        {
          home.packages = [ game ];
        }
        (
          {
            "Shattered Pixel Dungeon" = {
              target = game;

              # artwork = {
              #   cover = pkgs.npins-sources.shattered-pixel-dungeon-cover;
              #   header = pkgs.npins-sources.shattered-pixel-dungeon-header;
              #   hero = pkgs.npins-sources.shattered-pixel-dungeon-hero;
              #   icon = pkgs.npins-sources.shattered-pixel-dungeon-icon;
              #   logo = pkgs.npins-sources.shattered-pixel-dungeon-logo;
              # };
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

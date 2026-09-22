{
  zen,
  ...
}:

{
  zen.games.hypersomnia = {
    description = ''
      good top down shooter
      it alike Intravenous idk

      for steam in steam config lol
    '';

    meta = {
      package = pkgs: pkgs.hypersomnia;
    };

    wiki = {
      "Hypersomnia" = {
        links = [
          {
            name = "main-page";
            link = "https://hypersomnia.io";
            logo = "https://hypersomnia.io/assets/images/menu_game_logo.png";
          }
        ];
      };
    };

    homeManagerNixos =
      {
        self',
        ...
      }:
      let
        meta = zen.games.hypersomnia.meta;
      in
      {
        home.packages = [
          (meta.package self'.packages)
        ];
      };
  };
}

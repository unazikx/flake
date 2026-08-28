/*
  Keep up, I'm too fast, I'm too fast
  Push my foot up on that pedal, then I'm gone
  (G-g-g-gone, gone, gone)
  Keep up on my track, on my track
  Boy, I'll dust ya, keep my numbers going strong
  (Strong, strong, str-str-str-strong)

  KEEP UP lyrics © Kobalt Music Publishing Ltd.
*/

{
  ...
}:

{
  zen.games.srb2 = {
    description = ''
      sonic game, best on my opinion
    '';

    wiki = {
      "Sonic Robo Blast 2" = {
        links = [
          {
            name = "addons-list";
            url = "https://mb.srb2.org/addons";
            logo = "https://srb2mb-externaldata.nyc3.cdn.digitaloceanspaces.com/data/assets/logo/srb2mb_sonic.png";
          }
          {
            name = "multiplayer-guide";
            url = "https://www.srb2.org/about/multiplayer";
            logo = "https://www.srb2.org/wp-content/themes/srb2/images/srb2org-banner.png";
          }
        ];
      };
    };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.srb2
        ];
      };
  };
}

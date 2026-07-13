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

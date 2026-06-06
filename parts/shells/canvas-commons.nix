{
  ...
}:

{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      make-shells.common-canvas = {
        packages = [
          pkgs.nodejs
          pkgs.ffmpeg
        ];
      };
    };
}

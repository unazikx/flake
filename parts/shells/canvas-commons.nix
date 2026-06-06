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
        shellHook = ''
          if command -v fish > /dev/null 2>&1; then
            exec fish
          fi
        '';

        packages = [
          pkgs.nodejs
          pkgs.ffmpeg
        ];
      };
    };
}

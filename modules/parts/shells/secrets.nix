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
      make-shells.secrets = {
        shellHook = ''
          if command -v fish > /dev/null 2>&1; then
            exec fish
          fi
        '';

        packages = [
          # keep-sorted start
          pkgs.age
          pkgs.sops
          pkgs.ssh-to-age
          # keep-sorted end
        ];
      };
    };
}

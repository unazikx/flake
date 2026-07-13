{
  ...
}:

{
  zen.programs.default = {
    os =
      {
        pkgs,
        lib,
        ...
      }:
      {
        environment = {
          defaultPackages = lib.mkForce [ ];

          systemPackages = [
            pkgs.helix
            pkgs.killall
            pkgs.wget
          ];
        };
      };
  };
}

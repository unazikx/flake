{
  ...
}:

{
  zen.services.fprintd = {
    description = ''
      driver for fingerprinting
      pam and maybe something else
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        services.fprintd = {
          enable = true;
          package = pkgs.fprintd;
        };
      };
  };
}

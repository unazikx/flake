{
  zen,
  ...
}:

{
  zen.secrets =
    let
      meta = zen.secrets.meta;
    in
    {
      meta = {
        dir = "/var/lib";
        yubikey = "${meta.dir}/yubikey";
      };

      includes = [
        zen.custom.secrets
      ];
    };
}

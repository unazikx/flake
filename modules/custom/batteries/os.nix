{
  den,
  lib,
  ...
}:

{
  den.classes = {
    os = { };
  };

  den.policies.os-to-host-extended =
    {
      host,
      ...
    }:
    lib.optional
      (
        host ? class
        && builtins.elem host.class [
          "nixos"
          "finix"
          "darwin"
        ]
      )
      (
        den.lib.policy.route {
          fromClass = "os";
          intoClass = host.class;
          path = [ ];
        }
      );

  den.default = {
    includes = [
      den.policies.os-to-host-extended
    ];

    excludes = [
      den.policies.os-to-host
    ];
  };
}

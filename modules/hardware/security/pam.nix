{
  ...
}:

{
  zen.hardware.security.pam = {
    nixos =
      {
        lib,
        ...
      }:
      {
        security.pam.services =
          lib.genAttrs
            [
              "su"
              "sudo"
              "login"
              "greetd"
            ]
            (_: {
              fprintAuth = true;
            });
      };
  };
}

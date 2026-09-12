{
  ...
}:

{
  zen.services.openssh = {
    description = ''
      service for connect to machine via ssh
      very useful for distant actions
    '';

    nixos =
      {
        ...
      }:
      {
        services.openssh = {
          enable = true;
          settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
          };
        };
      };
  };
}

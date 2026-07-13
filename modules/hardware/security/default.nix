{
  zen,
  ...
}:

{
  zen.hardware.security = {
    includes = [
      zen.hardware.security.pam
      zen.hardware.security.polkit
      zen.hardware.security.sudo
    ];
  };
}

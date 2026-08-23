{
  zen,
  ...
}:

{
  zen.hardware.boot = {
    description = ''
      boot settings
      kernel and this modules
    '';

    includes = [
      zen.hardware.boot.kernel
      zen.hardware.boot.plymouth
    ];
  };
}

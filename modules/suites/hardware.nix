{
  zen,
  ...
}:

{
  zen.suites.hardware = {
    includes = [
      # keep-sorted start
      zen.hardware.bluetooth
      zen.hardware.boot
      zen.hardware.networking
      zen.hardware.security
      zen.hardware.sound.pipewire
      zen.miscellaneous.locales
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.programs.default
      zen.services.dbus
      # keep-sorted end
    ];
  };
}

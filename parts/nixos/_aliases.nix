{
  lib,
  ...
}:

{
  imports = [
    # INFO: hm aliases
    (lib.mkAliasOptionModule
      [ "hm" ]
      [
        "home-manager"
        "users"
        lib.userName
      ]
    )

    (lib.mkAliasOptionModule
      [ "hmPackages" ]
      [
        "home-manager"
        "users"
        lib.userName
        "home"
        "packages"
      ]
    )

    (lib.mkAliasOptionModule
      [ "hmMime" ]
      [
        "home-manager"
        "users"
        lib.userName
        "xdg"
        "mimeApps"
        "defaultApplications"
      ]
    )

    # INFO: nixos aliases
    (lib.mkAliasOptionModule
      [ "packages" ]
      [
        "environment"
        "systemPackages"
      ]
    )

    (lib.mkAliasOptionModule
      [ "tmp" ]
      [
        "systemd"
        "tmpfiles"
        "settings"
      ]
    )
  ];
}

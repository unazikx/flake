{
  zen,
  ...
}:

{
  zen.programs.gui.firefox-pwa = {
    description = ''
      turn websites to PWA as applications
    '';

    meta =
      let
        meta = zen.programs.gui.firefox-pwa.meta;
      in
      {
        truncate = builtins.substring 0 26;
        getHash = user: meta.truncate (builtins.hashString "sha1" user);
        name = lib: name: lib.toUpper (meta.getHash name);
      };

    homeManagerNixos =
      {
        lib,
        user,
        ...
      }:
      let
        meta = zen.programs.gui.firefox-pwa.meta;
      in
      {
        programs.firefoxpwa = {
          enable = true;

          profiles = {
            "${meta.name lib user.userName}" = {
              name = user.userName;
            };
          };

          settings = {
            config = {
              runtime_enable_wayland = true;
              runtime_use_portals = true;
              use_linked_runtime = true;
            };
          };
        };
      };
  };
}

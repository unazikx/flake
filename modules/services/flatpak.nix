{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   nix-flatpak = {
  #     type = "github";
  #     owner = "gmodena";
  #     repo = "nix-flatpak";
  #   };
  #   # keep-sorted end
  # };

  zen.services.flatpak = {
    description = ''
      self packages in containers
      or not...idk isolated
      declarative, ye
    '';

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        services.flatpak = {
          enable = true;

          update.onActivation = true;
          uninstallUnmanaged = true;

          remotes = lib.mkOptionDefault [
            {
              name = "flathub-beta";
              location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
            }
          ];

          packages = lib.attrValues {
            sober = {
              flatpakref = "https://sober.vinegarhq.org/sober.flatpakref";
              sha256 = "1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
            };

            hytale = {
              appId = "com.hytale.Launcher";
              sha256 = "0pw1f4p5902hd9am1hnvmxy7271vf2xgyvszdj17zndwp56ij5l8";

              bundle = "${pkgs.fetchurl {
                url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak";
                sha256 = "0ijyg7kab1ixa6bds44agxfjds6m0ig5z6xl3rnc5lx9gj4nz88w";
              }}";
            };
          };

          overrides.global = {
            Context = {
              filesystems = [
                "${config.home.homeDirectory}:rw"
                "/media/disks:rw"
              ];

              sockets = [
                "wayland"
                "!x11"
                "!fallback-x11"
              ];
            };
          };
        };
      };
  };
}

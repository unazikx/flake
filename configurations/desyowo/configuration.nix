{
  zen,
  ...
}:

{
  den.hosts.desyowo = {
    system = "x86_64-linux";
    class = "nixos";

    defaultUser = "chizea";

    users = {
      chizea = {
        classes = [ "homeManager" ];
      };
    };
  };

  zen.hosts.desyowo = {
    includes = [
      # keep-sorted start block=yes
      (zen.hardware.networking.hosts [
        "api.github.com"
        "api.spotify.com"
      ])
      zen.hardware.boot.systemd-boot
      zen.hardware.compression.zram
      zen.hardware.mounting
      zen.miscellaneous.disko
      zen.miscellaneous.home-manager
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.nix.ncro
      zen.miscellaneous.nur
      zen.miscellaneous.sopsnix
      zen.miscellaneous.version
      zen.programs.cli.nixos-cli
      zen.programs.cli.rusted-tools
      zen.services.greetd
      zen.services.proxy-suite
      zen.styles.stylix
      zen.suites.hardware
      # keep-sorted end
    ];

    excludes = [
      zen.miscellaneous.nix.settings
    ];
  };

  zen.users.chizea = {
    includes = [
      # keep-sorted start
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.miscellaneous.xdg
      zen.programs.cli.fastfetch
      zen.programs.cli.monitor
      zen.programs.cli.rezka-fzf
      zen.programs.cli.ssh
      zen.programs.desktop.kde-plasma
      zen.programs.editors.helix
      zen.programs.gui.ayugram
      zen.programs.gui.easy-effects
      zen.programs.gui.firefox
      zen.programs.gui.throne
      zen.programs.terminal.fish
      zen.programs.terminal.trash
      zen.programs.terminal.zoxide
      zen.services.playerctld
      zen.suites.theming
      # keep-sorted end
    ];
  };
}

{
  zen,
  ...
}:

{
  den.hosts.declaoke = {
    system = "x86_64-linux";
    class = "nixos";

    mainUser = "mathematix";

    device = "/dev/null";

    age = "age1hlrj3k4k5ykwd9x4kw37y20aaa5lzlkzpa9sp684zzjm4a547sus972gmt";

    users.mathematix = {
      classes = [ "homeManager" ];

      age = "age1qnuepztxp5edmz69c9vtu72czljuzlml0eq8wm636tat4x6w7gessy7p53";
    };
  };

  zen.hosts.declaoke = {
    includes = [
      # keep-sorted start block=yes
      (zen.hardware.networking.hosts [
        "api.github.com"
        "api.spotify.com"
      ])
      zen.hardware.bluetooth
      zen.hardware.boot.systemd-boot
      zen.hardware.compression.zram
      zen.hardware.compression.zswap
      zen.hardware.mounting
      zen.hardware.power
      zen.hardware.printing
      zen.miscellaneous.disko
      zen.miscellaneous.home-manager
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.nix.substituters
      zen.miscellaneous.nur
      zen.miscellaneous.version
      zen.programs.cli.nixos-cli
      zen.programs.cli.rusted-tools
      zen.secrets.sopsnix
      zen.services.auto-cpu-freq
      zen.services.greetd
      zen.services.proxy-suite
      zen.services.tailscale
      zen.services.tlp
      zen.styles.stylix
      zen.suites.hardware
      # keep-sorted end
    ];

    excludes = [
      zen.miscellaneous.nix.settings
    ];
  };

  zen.users.mathematix = {
    includes = [
      # keep-sorted start
      zen.miscellaneous.nix
      zen.miscellaneous.users
      # zen.games.umu-launcher
      zen.miscellaneous.xdg
      zen.programs.cli.distrobox
      zen.programs.cli.fastfetch
      zen.programs.cli.lowfi
      zen.programs.cli.monitor
      zen.programs.cli.rezka-fzf
      zen.programs.desktop.umbriel
      zen.programs.editors.helix
      zen.programs.gui._64gram
      zen.programs.gui.easy-effects
      zen.programs.gui.firefox
      zen.programs.gui.throne
      zen.programs.terminal.fish
      zen.programs.terminal.trash
      zen.programs.terminal.zoxide
      zen.suites.theming
      # keep-sorted end
    ];
  };
}

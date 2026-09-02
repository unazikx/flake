{
  zen,
  ...
}:

{
  den.hosts.jetpure = {
    system = "x86_64-linux";
    class = "nixos";

    isInstaller = false;
    flakeDir = toString /etc/nixos;
    defaultUser = "nixzoid";

    drives = {
      system = toString /dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B72828C9A2D;
      # https://www.kingston.com/en/ssd/a400-solid-state-drive
    };

    sopsKey = "age1c3z633k2m0vgfn5vjflu763lzadg2lddfnzwwyhvmyf053quqqtsh0cdqz";

    users = {
      nixzoid = {
        classes = [ "homeManager" ];
        defaultWm = "sway";
        defaultShell = "fish";
      };
    };
  };

  zen.hosts.jetpure = {
    includes = [
      # keep-sorted start block=yes
      (zen.hardware.networking.hosts [
        "api.github.com"
        "api.spotify.com"
        "login5.spotify.com"
        "encore.scdn.co"
        "gew1-spclient.spotify.com"
        "spclient.wg.spotify.com"
        "api-partner.spotify.com"
        "aet.spotify.com"
        "www.spotify.com"
        "accounts.spotify.com"
        "open.spotify.com"
        "accounts.scdn.co"
        "gew1-dealer.spotify.com"
        "www-growth.scdn.co"
      ])
      zen.games.xbox.driver
      zen.hardware.boot.systemd-boot
      zen.hardware.compression.zram
      zen.hardware.cpu-gpu
      zen.hardware.mounting
      zen.miscellaneous.agenix
      zen.miscellaneous.disko
      zen.miscellaneous.home-manager
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.nix.ncro
      zen.miscellaneous.sopsnix
      zen.miscellaneous.version
      zen.programs.cli.nixos-cli
      zen.programs.cli.rusted-tools
      zen.services.caddy
      zen.services.glance
      zen.services.greetd
      zen.services.proxy-suite
      zen.services.qbittorrent.flood
      zen.services.tailscale
      zen.services.vaultwarden
      zen.styles.stylix
      zen.suites.hardware
      zen.suites.media
      # keep-sorted end
    ];
  };

  zen.users.nixzoid = {
    includes = [
      # keep-sorted start
      zen.games.gale
      zen.games.heroic
      zen.games.hytale.launcher
      zen.games.minecraft.prismlauncher
      zen.games.minecraft.xmcl
      zen.games.steam
      zen.games.umu-launcher
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.miscellaneous.xdg
      zen.programs.cli.fastfetch
      zen.programs.cli.gdu
      zen.programs.cli.git
      zen.programs.cli.monitor
      zen.programs.cli.rbw
      zen.programs.cli.rezka-fzf
      zen.programs.cli.ssh
      zen.programs.cli.yazi
      zen.programs.desktop.sway
      zen.programs.desktop.vicinae
      zen.programs.editors.helix
      zen.programs.gui.ayugram
      zen.programs.gui.blender
      zen.programs.gui.easy-effects
      zen.programs.gui.keepassxc
      zen.programs.gui.librewolf
      zen.programs.gui.nixcord
      zen.programs.gui.obs-studio
      zen.programs.gui.qutebrowser
      zen.programs.gui.spotify
      zen.programs.gui.throne
      zen.programs.gui.zathura
      zen.programs.terminal.fish
      zen.programs.terminal.translate-shell
      zen.programs.terminal.trash
      zen.programs.terminal.zoxide
      zen.services.playerctld
      zen.suites.theming
      # keep-sorted end
    ];
  };
}

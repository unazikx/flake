{
  zen,
  ...
}:

{
  den.hosts.blackmamba = {
    system = "x86_64-linux";
    class = "nixos";

    isInstaller = false;
    flakeDir = toString /etc/nixos;
    defaultUser = "hackerx";

    drives = {
      system = toString /dev/disk/by-id/nvme-RPFTJ256PDD2MWX_SS0R27339Z1CD95Z1273;
      # https://www.impactcomputers.com/hard-drives-ssd/union-memory-rpftj256pdd2mwx

      samsanya = toString /dev/disk/by-id/nvme-SAMSUNG_MZVKW512HMJP-000H1_S34CNX0JA08028;
    };

    sopsKey = "age1334jkz6qgtwqctj20zct5ha8psd5ds5yz5n6frxrrwj74l8jcg3qeywx0a";

    users = {
      hackerx = {
        classes = [ "homeManager" ];
        defaultWm = "sway";
        defaultShell = "fish";
      };
    };
  };

  zen.hosts.blackmamba = {
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
      zen.hardware.boot.systemd-boot
      zen.hardware.compression.zswap
      zen.hardware.cpu-gpu
      zen.hardware.mounting
      zen.hardware.power
      zen.miscellaneous.disko
      zen.miscellaneous.home-manager
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.sopsnix
      zen.miscellaneous.version
      zen.programs.cli.nixos-cli
      zen.programs.cli.rusted-tools
      zen.services.caddy
      zen.services.greetd
      zen.services.proxy-suite
      zen.styles.stylix
      zen.suites.hardware
      zen.suites.media
      # keep-sorted end
    ];
  };

  zen.users.hackerx = {
    includes = [
      # keep-sorted start
      zen.games.hytale.launcher
      zen.games.minecraft.prismlauncher
      zen.games.minecraft.xmcl
      zen.games.steam
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.miscellaneous.xdg
      zen.programs.cli.cava
      zen.programs.cli.fastfetch
      zen.programs.cli.gdu
      zen.programs.cli.git
      zen.programs.cli.monitor
      zen.programs.cli.rbw
      zen.programs.cli.rezka-fzf
      zen.programs.cli.ssh
      zen.programs.cli.yazi
      zen.programs.desktop.sway
      zen.programs.editors.helix
      zen.programs.gui.ayugram
      zen.programs.gui.easy-effects
      zen.programs.gui.librewolf
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

{
  zen,
  ...
}:

{
  den.hosts.jetpure = {
    system = "x86_64-linux";
    class = "nixos";

    sopsKey = "age16dzy76gf6jcw03cppgghm7a8ld4g57f73z85wcj9fvq7w3ct53rs4rclm7";
    flakeDir = toString /etc/nixos;
    drive = toString /dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B72828C9A2D;
    # https://www.kingston.com/en/ssd/a400-solid-state-drive

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
      (zen.miscellaneous.users.getty "nixzoid")
      zen.hardware.cpu-gpu
      zen.hardware.mounting
      zen.miscellaneous.disko
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.secrets
      zen.programs.cli.nixos-cli
      zen.programs.cli.rusted-tools
      zen.services.caddy
      zen.services.glance
      zen.services.qbittorrent.flood
      zen.services.tailscale
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
      zen.programs.terminal.fish
      zen.programs.terminal.zoxide
      zen.games.minecraft.prismlauncher
      zen.games.steam
      zen.miscellaneous.users
      zen.miscellaneous.xdg
      zen.programs.cli.cava
      zen.programs.cli.fastfetch
      zen.programs.cli.gdu
      zen.programs.cli.git
      zen.programs.cli.monitor
      zen.programs.cli.rbw
      zen.programs.cli.ssh
      zen.programs.cli.yazi
      zen.programs.cli.youtube-cli
      zen.programs.desktop.sway
      zen.programs.editors.helix
      zen.programs.editors.opencode
      zen.programs.gui.ayugram
      zen.programs.gui.easy-effects
      zen.programs.gui.librewolf
      zen.programs.gui.nixcord
      zen.programs.gui.qutebrowser
      zen.programs.gui.spotify
      zen.programs.gui.throne
      zen.programs.gui.zathura
      zen.programs.terminal.translate-shell
      zen.programs.terminal.trash
      zen.services.greetd
      zen.suites.music
      zen.suites.theming
      # keep-sorted end
    ];

    user =
      {
        config,
        ...
      }:
      {
        hashedPasswordFile = config.sops.secrets."password".path;
      };
  };
}

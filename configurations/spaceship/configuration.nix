{
  zen,
  ...
}:

{
  den.hosts.spaceship = {
    system = "x86_64-linux";
    class = "nixos";

    isInstaller = true;
  };

  zen.hosts.spaceship = {
    includes = [
      # keep-sorted start block=yes
      zen.programs.cli.nixos-cli
      zen.styles.stylix
      # keep-sorted end
    ];

    nixos =
      {
        inputs,
        pkgs,
        config,
        ...
      }:
      {
        imports = [
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ];

        programs.fish = {
          enable = true;
        };

        environment.systemPackages = [
          pkgs.disko
          pkgs.helix
          pkgs.sops
        ];

        users.defaultUserShell = config.programs.fish.package;

        isoImage.squashfsCompression = "zstd -b 32768";

        stylix.base16Scheme = {
          name = "Catppuccin Mocha";
          author = "https://github.com/catppuccin/catppuccin";
          base00 = "#1e1e2e";
          base01 = "#181825";
          base02 = "#313244";
          base03 = "#45475a";
          base04 = "#585b70";
          base05 = "#cdd6f4";
          base06 = "#f5e0dc";
          base07 = "#b4befe";
          base08 = "#f38ba8";
          base09 = "#fab387";
          base0A = "#f9e2af";
          base0B = "#a6e3a1";
          base0C = "#94e2d5";
          base0D = "#89b4fa";
          base0E = "#cba6f7";
          base0F = "#f2cdcd";
        };
      };
  };
}

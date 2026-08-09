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
      zen.miscellaneous.nix.settings
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
          name = "Horizon Dark";
          author = "Michaël Ball (https://github.com/michael-ball)";
          base00 = "#1c1e26";
          base01 = "#232530";
          base02 = "#2e303e";
          base03 = "#6f6f70";
          base04 = "#9da0a2";
          base05 = "#cbced0";
          base06 = "#dcdfe4";
          base07 = "#e3e6ee";
          base08 = "#e93c58";
          base09 = "#e58d7d";
          base0A = "#efb993";
          base0B = "#efaf8e";
          base0C = "#24a8b4";
          base0D = "#df5273";
          base0E = "#b072d1";
          base0F = "#e4a382";
        };
      };
  };
}

{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nixos-cli = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-cli";
      ref = "main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.optnix.follows = "optnix";
    };

    optnix = {
      type = "github";
      owner = "water-sucks";
      repo = "optnix";
      ref = "main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.cli.nixos-cli = {
    description = ''
      unified NixOS replacement tools
    '';

    nixos =
      {
        inputs,
        pkgs,
        lib,
        host,
        ...
      }:
      {
        imports = [
          inputs.nixos-cli.nixosModules.nixos-cli
        ];

        environment.systemPackages = [
          pkgs.nix-output-monitor
        ];

        programs.nixos-cli = {
          enable = true;

          settings = {
            config_location = lib.mkIf (host.isInstaller != true) "${host.flakeDir}#${host.hostName}";

            confirmation.always = true;

            apply = {
              use_nom = true;
              reexec_as_root = true;
            };

            differ = {
              tool = "command";
              command = [
                (lib.getExe pkgs.nvd)
                "diff"
              ];
            };
          };
        };
      };
  };
}

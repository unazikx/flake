{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    pedantix = {
      type = "github";
      owner = "swarsel";
      repo = "pedantix";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.treefmt-nix.follows = "treefmt-nix";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  imports = [
    inputs.treefmt-nix.flakeModule
    inputs.pedantix.flakeModules.default
  ];

  zen.flake-parts.default = {
    treefmt =
      {
        ...
      }:
      {
        programs = {
          deadnix = {
            enable = true;
            includes = [ "*.nix" ];
          };

          keep-sorted.enable = true;

          nixfmt = {
            enable = true;
            includes = [ "*.nix" ];
          };

          pedantix = {
            enable = false;
            includes = [ "*.nix" ];
            excludes = [
              "flake.nix"
              "configuration.nix"
            ];

            settings = {
              args.first = [
                "self"
                "self'"
                "inputs"
                "inputs'"
                "pkgs"
                "lib"
                "config"
                "osConfig"
                "host"
                "user"
              ];
              attrs.first = [
                "flake-file"
                "den"
                "zen"
                "imports"
                "enable"
                "package"
                # flake-fil
                "type"
                "owner"
                "repo"
                "ref"
                "inputs"
              ];
              formatter = "off";
              top-level-blank-lines = 1;
            };
          };

          prettier = {
            enable = true;
            includes = [ "*.md" ];

            settings = {
              bracketSameLine = true;
              bracketSpacing = true;
              embeddedLanguageFormatting = "auto";
              tabWidth = 2;
              useTabs = true;
            };
          };
        };
      };
  };
}

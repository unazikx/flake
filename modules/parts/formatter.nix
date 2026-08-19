{
  ...
}:

{
  zen.flake-parts.default = {
    root =
      {
        pkgs,
        ...
      }:
      {
        # https://github.com/numtide/treefmt-nix/tree/main/examples
        formatter = pkgs.treefmt.withConfig {
          runtimeInputs = [
            # keep-sorted start block=yes
            pkgs.deadnix
            pkgs.keep-sorted
            pkgs.nixfmt
            pkgs.prettier
            # keep-sorted end
          ];

          settings = {
            formatter = {
              # keep-sorted start block=yes newline_separated=yes
              deadnix = {
                command = "deadnix";
                excludes = [ ];
                includes = [ "*.nix" ];
                options = [ "--edit" ];
              };

              keep-sorted = {
                command = "keep-sorted";
                excludes = [ ];
                includes = [ "*" ];
                options = [ ];
              };

              nixfmt = {
                command = "nixfmt";
                includes = [ "*.nix" ];
              };

              prettier = {
                command = "prettier";
                excludes = [ ];
                includes = [
                  "*.md"
                  "*.mdx"
                ];
                options = [ "--write" ];
              };
              # keep-sorted end
            };
          };
        };
      };
  };
}

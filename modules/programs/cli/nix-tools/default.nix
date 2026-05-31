# INFO:
# export shell variables for tokens
# alias for repl and rebuild
# nurl -> prefetch repos and other

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          packages = lib.attrValues {
            inherit (pkgs)
              cachix
              nix-tree
              nurl
              ;
          };

          environment = {
            interactiveShellInit =
              # bash
              ''
                export CACHIX_AUTH_TOKEN="$(cat ${config.sopsnix."tokens/cachix"})"
                export GITHUB_TOKEN="$(cat ${config.sopsnix."tokens/github"})"
              '';

            shellAliases = {
              rebuild = "sudo nixos-rebuild switch --flake ${lib.flakeDir}#${lib.configurationName}";
              repl = "nixos-rebuild repl --flake ${lib.flakeDir}#${lib.configurationName}";
            };
          };

          hm.programs.nix-index-database.comma.enable = true;
        };
    };
}

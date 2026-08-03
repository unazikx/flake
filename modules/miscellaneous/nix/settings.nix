{
  ...
}:

{
  zen.miscellaneous.nix.settings = {
    os =
      {
        ...
      }:
      {
        nix.settings = {
          warn-dirty = false;
          auto-optimise-store = true;
          builders-use-substitutes = true;

          max-jobs = 2;
          cores = 2;

          experimental-features = [
            "nix-command"
            "flakes"
          ];

          trusted-users = [ "@wheel" ];
        };
      };

    homeManager =
      {
        config,
        ...
      }:
      {
        home.sessionVariables = {
          CACHIX_AUTH_TOKEN = "$(cat ${config.sops.secrets."programs/cachix".path})";
          GITHUB_TOKEN = "$(cat ${config.sops.secrets."programs/github".path})";
        };

        sops.secrets = {
          "programs/cachix" = { };
          "programs/github" = { };
        };
      };
  };
}

{
  ...
}:

{
  zen.miscellaneous.nix.settings =
    let
      settings = {
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
    in
    {
      nixos =
        {
          ...
        }:
        {
          nix = {
            inherit settings;
          };
        };

      finix =
        {
          ...
        }:
        {
          services.nix-daemon = {
            inherit settings;
          };
        };

      darwin =
        {
          ...
        }:
        {
          nix = {
            inherit settings;
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

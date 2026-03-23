# INFO:
# i waited 7 years...finally

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
          pkgs,
          ...
        }:
        {
          persist.user.directories = [ ".local/share/hytale-launcher" ];

          hmPackages = [ inputs.hytale-launcher.packages.${pkgs.system}.default ];
        };
    };
}

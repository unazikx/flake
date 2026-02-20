{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          # hmPackages = [ pkgs.rezka-fzf ];
        };
    };
}

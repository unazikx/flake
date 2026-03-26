{
  inputs,
  ...
}:

{
  perSystem =
    {
      inputs',
      pkgs,
      lib,
      ...
    }:
    {
      legacyPackages.${baseNameOf ./.} = {
        nix-configured = inputs'.nvf.packages.nix;

        custom-configured =
          (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = lib.toList (inputs.import-tree ./_config);
          }).neovim;
      };
    };
}

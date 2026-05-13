# INFO:
# options list - https://nvf.notashelf.dev/options.html

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
        nvchad = inputs'.nix-nvchad.packages.default;

        nvf-own =
          (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = lib.toList (inputs.import-tree ./_config);
          }).neovim;
      };
    };
}

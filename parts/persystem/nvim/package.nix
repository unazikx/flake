# INFO:
# options list - https://nvf.notashelf.dev/options.html

{
  inputs,
  ...
}:

{
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    {
      legacyPackages.${baseNameOf ./.} = {
        nvf-own =
          (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = lib.toList (inputs.import-tree ./_config);
          }).neovim;
      };
    };
}

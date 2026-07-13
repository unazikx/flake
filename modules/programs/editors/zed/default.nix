{
  zen,
  ...
}:

{
  zen.programs.editors.zed = {
    description = ''
      best gui IDE
      with treesitter and candys
    '';

    includes = [
      zen.programs.editors.zed.plugins
      zen.programs.editors.zed.settings
    ];

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.zed-editor = {
          enable = true;

          extraPackages = pkgs.default-lsp;
        };
      };
  };
}

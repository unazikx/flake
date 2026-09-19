{
  ...
}:

{
  zen.programs.desktop.gnome.extensions = {
    homeManagerNixos =
      {
        pkgs,
        ...
      }:
      {
        programs.gnome-shell = {
          extensions = [
            { package = pkgs.gnomeExtensions.zen; }
            { package = pkgs.gnomeExtensions.appindicator; }
            { package = pkgs.gnomeExtensions.just-perfection; }
            { package = pkgs.gnomeExtensions.gtk4-desktop-icons-ng-ding; }
            { package = pkgs.gnomeExtensions.add-to-desktop; }
            { package = pkgs.gnomeExtensions.keyboard-informer; }
            { package = pkgs.gnomeExtensions.copyous; }
            { package = pkgs.gnomeExtensions.removable-drive-menu; }
          ];
        };
      };
  };
}

{
  pkgs,
  lib,
  config,
  ...
}:

lib.attrValues (
  {
    # https://nur.nix-community.org/repos/rycee
    # inherit (pkgs.nur.repos.rycee.firefox-addons) ... ;
    #
    # inherit (pkgs.firefox-addons) ... ;
    inherit (pkgs.nur.repos.rycee.firefox-addons)
      darkreader
      libredirect
      protondb-for-steam
      redirect-to-wiki-gg
      sponsorblock
      steam-database
      stylus
      translate-web-pages
      ublock-origin
      ;

    # from ../../../../packages/firefox-addons/package.nix
    inherit (pkgs.firefox-addons)
      torrserver-adder
      ;
  }
  // (lib.optionalAttrs config.hm.programs.keepassxc.enable {
    inherit (pkgs.firefox-addons) keepassxc-browser;
  })
  // (lib.optionalAttrs config.hm.programs.rbw.enable {
    inherit (pkgs.firefox-addons) bitwarden-password-manager;
  })
)

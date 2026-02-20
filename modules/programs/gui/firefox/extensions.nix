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

    # from ../../../../packages/firefox-addons/package.nix
    inherit (pkgs.own.firefox-addons)
      darkreader
      libredirect
      mal-sync
      protondb-for-steam
      redirectnixwiki
      sponsorblock
      steam-database
      styl-us
      torrserver-adder
      traduzir-paginas-web
      ublock-origin
      youtube-addon
      ;
  }
  // (lib.optionalAttrs config.hm.programs.keepassxc.enable {
    inherit (pkgs.own.firefox-addons) keepassxc-browser;
  })
  // (lib.optionalAttrs config.hm.programs.rbw.enable {
    inherit (pkgs.own.firefox-addons) bitwarden-password-manager;
  })
)

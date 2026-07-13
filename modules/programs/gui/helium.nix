{
  ...
}:

{
  zen.programs.gui.helium = {
    description = ''
      chromium based distro
      idk what say also
    '';

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.helium.nixosModules.helium
        ];
      };

    homeManagerNixos =
      {
        inputs,
        lib,
        ...
      }:
      {
        imports = [
          inputs.helium-flake.homeModules.helium
        ];

        programs.helium = {
          enable = true;

          extensions = lib.attrValues (
            import (
              lib.concatStringsSep "/" [
                inputs.myown
                "packages"
                "helium-addons"
                "output.nix.hidden"
              ]
            )
          );

          extraFlags = [ "--force-dark-mode" ];

          extraPolicies = {
            HomepageLocation = "https://start.duckduckgo.com";
            PasswordManagerEnabled = false;
            DeveloperToolsAvailability = 1;
            ManagedBookmarks = [
              {
                toplevel_name = "Nix Ecosystem";
              }
              {
                name = "Nix Packages";
                url = "https://search.nixos.org/packages";
              }
            ];
          };

          preferences = {
            browser.show_home_button = true;
            bookmark_bar.show_on_all_tabs = true;
          };
        };
      };
  };
}

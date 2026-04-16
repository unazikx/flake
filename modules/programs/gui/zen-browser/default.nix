# INFO:
# one of the best browsers ever

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
          lib,
          config,
          ...
        }:
        let
          _file = import ./settings.nix {
            inherit lib config;
          };
        in
        {
          hm = {
            programs.zen-browser = {
              enable = true;

              nativeMessagingHosts = lib.flatten [
                (
                  let
                    cfg = config.hm.programs.keepassxc;
                  in
                  lib.optionals cfg.enable cfg.package
                )
                (
                  let
                    cfg = config.hm.programs.firefoxpwa;
                  in
                  lib.optionals cfg.enable cfg.package
                )
              ];

              policies = _file.policies;

              profiles.${lib.userName} = {
                settings = _file.profiles;

                # userChrome = lib.readFile pkgs.own.firefox-themes.little-fox;

                extensions = {
                  force = true;

                  settings = _file.extension;

                  packages = lib.attrValues {
                    inherit (pkgs.own.firefox-addons)
                      # keep-sorted start
                      bitwarden-password-manager
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
                      voice-over-translation
                      youtube-addon
                      # keep-sorted end
                      ;
                  };
                };

                mods = lib.attrValues {
                  # keep-sorted start
                  "Better Ctrl-Tab" = "72f8f48d-86b9-4487-acea-eb4977b18f21";
                  "Better Findbar" = "a6335949-4465-4b71-926c-4a52d34bc9c0";
                  "Better Floating History" = "253a3a74-0cc4-47b7-8b82-996a64f030d5";
                  "Better Unloaded Tabs" = "f7c71d9a-bce2-420f-ae44-a64bd92975ab";
                  "Bigger Mute Icon" = "5c4d7772-d963-4672-ab03-e9d541438881";
                  "Bleeding Corner Fix" = "7d577b21-4685-4db2-bb17-d39d08eec199";
                  "Cleaner URLbar" = "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec";
                  "Floating Status Bar" = "906c6915-5677-48ff-9bfc-096a02a72379";
                  "Leftside Glance Buttons" = "20e8cc78-3dac-4db0-81a4-814672fb50af";
                  "Navbar Margin" = "6c122084-c4ec-4c9e-8cc5-3d87c3a089cb";
                  "Pimp Your PIP" = "599a1599-e6ab-4749-ab22-de533860de2c";
                  "Remove Tab X" = "1b88a6d1-d931-45e8-b6c3-bfdca2c7e9d6";
                  "Sleek Border" = "bc25808c-a012-4c0d-ad9a-aa86be616019";
                  "Smaller Compact Mode" = "5941aefd-67b0-453d-9b62-9071a31cbb0d";
                  "Smaller Zen Toast Popup" = "e51b85e6-cef5-45d4-9fff-6986637974e1";
                  "Trackpad Animation" = "8039de3b-72e1-41ea-83b3-5077cf0f98d1";
                  # keep-sorted end
                };

                extraConfig = lib.concatStringsSep "\n" (
                  map (file: lib.readFile file) [
                    # keep-sorted start
                    "${inputs.betterfox}/Fastfox.js"
                    "${inputs.betterfox}/Peskyfox.js"
                    "${inputs.betterfox}/Securefox.js"
                    "${inputs.betterfox}/Smoothfox.js"
                    "${inputs.betterfox}/user.js"
                    # keep-sorted end
                  ]
                );
              };
            };

            stylix.targets.zen-browser.profileNames = [ lib.userName ];
          };
        };
    };
}

# INFO:
# used for sound perfecting
# especcialy on my ThinkpadT14
# just cool
#
# WARN:
# used old...gtk version
# cause qt isnt cool

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
          ...
        }:
        {
          persist.user.directories = [
            ".config/easyeffects"
          ];

          hm = {
            disabledModules = [ "services/easyeffects.nix" ];
            imports = [ ./module.nix ];

            services.easyeffects = {
              enable = true;
              package = pkgs._2505.easyeffects;

              extraPresets = lib.mapAttrs (n: v: v) inputs.easyeffects-presets.effects;
            };
          };
        };
    };
}

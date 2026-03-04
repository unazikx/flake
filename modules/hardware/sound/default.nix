# INFO:
# module for audio manage

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          environment = {
            systemPackages = [ pkgs.pulsemixer ];
            shellAliases.pmx = "pulsemixer";
          };

          security.rtkit.enable = true;

          services.pipewire = {
            enable = true;

            pulse.enable = true;

            wireplumber.enable = true;

            alsa = {
              enable = true;
              support32Bit = true;
            };
          };
        };
    };
}

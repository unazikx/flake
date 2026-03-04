# INFO:
#
# > tr "FUCK NIXOS"
#     Нахуй Никсос

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          hm.programs.translate-shell = {
            enable = true;

            settings = {
              engine = "google";

              brief = true;
              show-original = false;

              hl = "en";
              tl = [ "ru" ];
            }
            // (import ./theme.nix);
          };
        };
    };
}

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
          persist.user.directories = [ ".local/share/bottles" ];

          hmPackages = [
            (pkgs.bottles.override {
              removeWarningPopup = true;
            })
          ];
        };
    };
}

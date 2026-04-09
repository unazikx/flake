# INFO:
# BEST RUSSIAN MESSENGER
# GOIDA ZOV!!!
# SLAVA GENERAL MAYOR

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          persist.user.directories = [ ];

          hmPackages = [ pkgs.max-messenger ];

          programs.firejail.wrappedBinaries = {
            max-messenger = {
              desktop = "${pkgs.max-messenger}/share/applications/MAX.desktop";
              executable = lib.getExe' pkgs.max-messenger "max";
            };
          };
        };
    };
}

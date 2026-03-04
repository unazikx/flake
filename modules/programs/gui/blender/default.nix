# INFO:
# 3d modeling, montage and rendering

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
          persist.user.directories = [
            ".config/blender"
          ];

          hm.home.packages = [ pkgs.blender ];
        };
    };
}

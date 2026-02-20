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
          hmPackages = [ pkgs.tenki ];

          hm.home.shellAliases = {
            ten = ''
              tenki --fps 80 \
                --wind disable \
                --timer-color cyan \
                --mode rain
            '';
          };
        };
    };
}

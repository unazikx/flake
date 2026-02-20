{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        {
          packages = [ pkgs.hut ];

          hm.xdg.configFile = {
            "hut/config".text = ''
              instance "sr.ht" {
              	# access-token "insert sops placeholder"
              	access-token-cmd cat ${config.sopsnix."tokens/hut"}
              }
            '';
          };
        };
    };
}

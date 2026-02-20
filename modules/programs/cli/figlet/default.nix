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
          hmPackages = [ pkgs.figlet ];

          hm.xdg.configFile =
            let
              mkFont =
                {
                  name,
                  sha256,
                }:
                {
                  name = "figlet/${name}.flf";
                  value.source = pkgs.fetchurl {
                    url = "http://www.figlet.org/fonts/${name}.flf";
                    inherit sha256;
                  };
                };
            in
            lib.listToAttrs (
              map mkFont [
                {
                  name = "doom";
                  sha256 = "sha256-PY/pljUmMp/51UFKl7D0fjqFLS8oimk/KThzD1ojDnU=";
                }
                {
                  name = "epic";
                  sha256 = "sha256-fzh5bNy8dGtCumgEmnSxNZ+67ndr2Q/1saKoW3W/kiY=";
                }
                {
                  name = "small";
                  sha256 = "sha256-YybYpxjLV2idXqqY0wG5KX729jACeWNbkBUyovPWqt8=";
                }
              ]
            );
        };
    };
}

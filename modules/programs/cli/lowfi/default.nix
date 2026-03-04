# INFO:
# web radio for lofi girl and links
#
# create .txt files in ./
# for getting aliases:
#   ./synthboy.txt -> lowfi-synthbow
#   ./rockMetal.txt -> lowfi-rockMetal

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
        let
          fromDir = (lib.filter (file: lib.match ".*\\.txt$" file != null) (lib.attrNames (lib.readDir ./.)));
        in
        {
          hmPackages = [
            pkgs.lowfi
            pkgs.kew
          ];

          hm.home.shellAliases = (
            lib.listToAttrs (
              map (file: {
                name = "lowfi-${lib.replaceStrings [ ".txt" ] [ "" ] file}";
                value = "lowfi -cmw 9 -t ${./. + "/${file}"}";
              }) fromDir
            )
          );
        };
    };
}

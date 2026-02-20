{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        let
          disable.enable = false;
          turnOff = list: lib.genAttrs list (_: lib.mkDefault disable);
        in
        {
          programs = turnOff [
            "nano"
            "command-not-found"
          ];

          documentation = turnOff [
            "dev"
            "doc"
            "info"
            "man"
            "nixos"
          ];

          hm = {
            news.display = "silent";

            programs.man = disable;

            manual = turnOff [
              "html"
              "json"
              "manpages"
            ];
          };
        };
    };
}

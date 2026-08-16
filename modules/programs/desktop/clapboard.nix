{
  zen,
  ...
}:

{
  zen.programs.desktop.clapboard = {
    description = ''
      modern clipboard with tofi frontend
      clipboard entries are in ~/.cache/clapboard
    '';

    includes = [
      zen.custom.clapboard
      zen.programs.desktop.tofi
    ];

    homeManager =
      {
        ...
      }:
      {
        services.clapboard = {
          enable = true;

          mode = "clipboard";

          settings = {
            launcher = [
              "tofi"
              "--fuzzy-match=true"
              "--prompt-text=copy: "
              "--padding-left=20%"
              "--padding-right=20%"
              "--padding-top=12%"
              "--padding-bottom=12%"
              "--num-results=12"
            ];
            history_size = 48;
          };
        };
      };
  };
}

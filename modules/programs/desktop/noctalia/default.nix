{
  zen,
  ...
}:

{
  zen.programs.desktop.noctalia = {
    description = ''
      modern desktop shell
      very good im impressed
    '';

    includes = [
      zen.miscellaneous.users.accounts
      zen.programs.desktop.noctalia.settings
    ];

    wiki = {
      "Noctalia" = {
        extra = ''
          dont use their flake, noctalia also in nixpkgs

          use `nix eval --expr --impure 'builtins.fromTOML (builtins.readFile ./noctalia.toml)'`
          for make nix attrs config from toml
        '';

        links = [
          {
            name = "noctalia-wiki";
            url = "https://docs.noctalia.dev/noctalia";
            logo = "https://docs.noctalia.dev/_astro/noctalia-logo.BwXc-yKG.svg";
          }
        ];
      };
    };

    homeManager =
      {
        ...
      }:
      {
        programs.noctalia = {
          enable = true;
        };

        stylix.targets = {
          noctalia.enable = true;
        };
      };
  };
}

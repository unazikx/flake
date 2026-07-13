{
  ...
}:

{
  zen.programs.editors.opencode.caveman = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.opencode = {
          skills = {
            caveman = "${
              pkgs.fetchFromGitHub {
                owner = "JuliusBrussee";
                repo = "caveman";
                rev = "0d95a81d35a9f2d123a5e9430d1cfc43d55f1bb0";
                hash = "sha256-VqRHx3/4SSCnEh3cUJ/he5saIfwNhS0hOzoH/wwtU2o=";
              }
            }/skills/caveman";
          };
        };
      };
  };
}

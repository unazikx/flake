{
  ...
}:

{
  zen.programs.editors.opencode.superpowers = {
    homeManager =
      {
        ...
      }:
      {
        programs.opencode = {
          settings = {
            plugin = [ "superpowers@git+https://github.com/obra/superpowers.git" ];
          };
        };
      };
  };
}

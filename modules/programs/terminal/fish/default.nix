{
  zen,
  ...
}:

{
  zen.programs.terminal.fish = {
    description = ''
      best shell
      needs upgrade/update
    '';

    includes = [
      zen.programs.terminal.fish.plugins
      zen.programs.terminal.fish.shell-init
      zen.programs.terminal.starship
      zen.programs.terminal.zoxide
    ];

    user =
      {
        lib,
        config,
        user,
        ...
      }:
      {
        shell = lib.mkIf (user.defaultShell == "fish") config.programs.fish.package;
      };

    nixos =
      {
        ...
      }:
      {
        programs.fish.enable = true;
      };

    homeManager =
      {
        ...
      }:
      {
        programs.fish = {
          enable = true;

          preferAbbrs = true;
          shellAbbrs = {
            gai = "git add --intent-to-add";
            gus = "git update-index --skip-worktree --assume-unchanged";
          };
        };
      };
  };
}

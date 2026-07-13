{
  zen,
  ...
}:

{
  zen.suites.shell = {
    includes = [
      # keep-sorted start
      zen.programs.terminal.fish
      zen.programs.terminal.zoxide
      # keep-sorted end
    ];
  };
}

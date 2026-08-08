{
  zen,
  ...
}:

{
  den.hosts.spaceship = {
    system = "x86_64-linux";
    class = "nixos";

    isInstaller = true;
  };

  zen.hosts.spaceship = {
    includes = [
      zen.programs.cli.nixos-cli
      zen.styles.stylix
    ];
  };
}

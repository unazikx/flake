{
  ...
}:

{
  zen.programs.gui.throne = {
    description = ''
      new gen nekoray
      good multi-protocol vpn-client
    '';

    nixos =
      {
        ...
      }:
      {
        programs.throne = {
          enable = true;
          tunMode.enable = true;
        };
      };
  };
}

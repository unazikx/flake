{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   max-ru = {
  #     type = "github";
  #     owner = "spiage";
  #     repo = "max-messenger";
  #     ref = "main";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.gui.max-ru = {
    description = ''
      russian messenger
      fuckin diabolical shit from Putin ass
    '';

    homeManagerNixos =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.max-ru.packages.default
        ];
      };
  };
}

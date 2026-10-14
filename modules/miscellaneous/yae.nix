{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   yae = {
  #     type = "github";
  #     owner = "fuwn";
  #     repo = "yae";
  #     ref = "main";
  #   };
  #   # keep-sorted end
  # };

  zen.miscellaneous.yae = {
    nixos =
      {
        inputs',
        ...
      }:
      {
        environment.systemPackages = [
          inputs'.yae.packages.yae
        ];
      };

    homeManager =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.yae.packages.yae
        ];
      };
  };
}

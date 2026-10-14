{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";
      ref = "main";
    };
    # keep-sorted end
  };

  zen.miscellaneous.nur = {
    os =
      {
        inputs,
        ...
      }:
      {
        nixpkgs.overlays = [
          inputs.nur.overlays.default
        ];
      };

    homeManager =
      {
        inputs,
        ...
      }:
      {
        nixpkgs.overlays = [
          inputs.nur.overlays.default
        ];
      };
  };
}

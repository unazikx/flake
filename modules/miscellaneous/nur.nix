{
  ...
}:

{
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
  };
}

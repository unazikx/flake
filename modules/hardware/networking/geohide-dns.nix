{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    geohide-dns = {
      type = "github";
      owner = "internet-helper";
      repo = "geohidedns";
      flake = false;
    };
    # keep-sorted end
  };

  zen.hardware.networking.geohide-dns = {
    description = ''
      geohide hosts for
      working apps geo blocks
    '';

    nixos =
      {
        inputs,
        lib,
        ...
      }:
      {
        networking.hostFiles = "${inputs.geohide-dns}/hosts/hosts" |> lib.singleton;
      };
  };
}

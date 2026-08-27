{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    finix = {
      type = "github";
      owner = "finix-community";
      repo = "finix";
    };

    finix-community = {
      type = "github";
      owner = "finix-community";
      repo = "community-modules";
    };
    # keep-sorted end
  };
}

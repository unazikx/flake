{
  ...
}:

{
  perSystem =
    {
      ...
    }:
    {
      files.file.".gitignore" = {
        text = ''
          *result
          *gitmal-output
        '';
      };
    };
}

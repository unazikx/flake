{
  ...
}:

{
  zen.programs.editors.opencode = {
    description = ''
      ai tool for coding and many also
      i use this for code and video montage

      code: nix, python, go
      video: remotion, canvas commons
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.opencode = {
          enable = true;

          enableMcpIntegration = true;

          settings = {
            model = "opencode-go/deepseek-v4-pro";
          };
        };
      };
  };
}

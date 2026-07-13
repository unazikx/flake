{
  ...
}:

{
  zen.programs.cli.distrobox = {
    description = ''
      os containers
      u can run Arch/Mint/Void linux
      in this system
    '';

    includes = [
      # zen.virtualization.podman
    ];

    homeManager =
      {
        ...
      }:
      {
        programs.distrobox = {
          enable = true;

          containers = {
            # fuck idk
          };
        };
      };
  };
}

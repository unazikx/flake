{
  ...
}:

{
  zen.hardware.virtualization.podman = {
    description = ''
      containers manager
      modern and useful
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        virtualisation = {
          podman = {
            enable = true;

            extraPackages = [
              pkgs.podman-compose
              pkgs.podman-tui
            ];

            dockerCompat = true;
            dockerSocket.enable = true;

            autoPrune = {
              enable = true;
              flags = [
                "--all"
                "--volumes"
              ];
            };

            defaultNetwork.settings = {
              dns_enabled = true;
            };
          };

          spiceUSBRedirection.enable = true;
        };
      };
  };
}

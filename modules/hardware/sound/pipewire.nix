{
  zen,
  ...
}:

{
  zen.hardware.sound.pipewire = {
    description = ''
      audio server
      with screencast support
    '';

    includes = [
      zen.hardware.sound.rtkit
    ];

    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.pulsemixer
        ];

        services.pipewire = {
          enable = true;

          pulse.enable = true;

          wireplumber.enable = true;

          alsa = {
            enable = true;
            support32Bit = true;
          };
        };
      };
  };
}

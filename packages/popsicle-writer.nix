{
  self,
  writeShellApplication,
  popsicle,
  lib,
}:

writeShellApplication {
  name = "popsicle-writer";

  runtimeInputs = [
    popsicle
  ];

  text = ''
    popsicle \
      ${self.nixosConfigurations.spaceship.config.system.build.image} "$@"
  '';
}

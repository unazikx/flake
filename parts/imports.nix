{
  inputs,
  lib,
  ...
}:

{
  systems = lib.flatten [
    "x86_64-linux"
    lib.platforms.darwin
  ];

  imports = [
    # keep-sorted start
    inputs.den.flakeModule
    inputs.disko.flakeModule
    inputs.flake-aspects.flakeModule
    inputs.flake-parts.flakeModules.bundlers
    inputs.flake-parts.flakeModules.modules
    inputs.github-actions-nix.flakeModule
    inputs.home-manager.flakeModules.default
    inputs.make-shell.flakeModules.default
    inputs.nix-wrapper-modules.flakeModules.default
    inputs.process-compose-flake.flakeModule
    inputs.treefmt-nix.flakeModule
    # keep-sorted end
  ];

  debug = true;
}

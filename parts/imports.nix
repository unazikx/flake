# INFO:
# flake-parts modules
# and other directories imports

{
  inputs,
  ...
}:

{
  systems = [
    "x86_64-linux"
  ];

  imports =
    with inputs;
    let
      mkFilter = files: import-tree.filter (nixpkgs.lib.hasSuffix files);
    in
    [
      # directories with name ./_something will be ignored
      (mkFilter "default.nix" [ ../modules ])
      (mkFilter "configuration.nix" [ ../machines ])

      # keep-sorted start
      disko.flakeModule
      flake-aspects.flakeModule
      flake-parts.flakeModules.bundlers
      flake-parts.flakeModules.modules
      github-actions-nix.flakeModule
      home-manager.flakeModules.default
      make-shell.flakeModules.default
      nix-wrapper-modules.flakeModules.default
      process-compose-flake.flakeModule
      treefmt-nix.flakeModule
      # keep-sorted end
    ];

  debug = true;
}

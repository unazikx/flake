{
  self,
  lib,
  ...
}:

{
  zen.miscellaneous.nix.overlays = [
    {
      description = ''
        imports overlays from flake
      '';
    }
    (lib.genAttrs
      [
        "nixos"
        "darwin"
        "homeManager"
      ]
      (_: {
        nixpkgs.overlays = [
          self.overlays.nixpkgs-branches
          self.overlays.system-backport
        ];
      })
    )
  ];
}

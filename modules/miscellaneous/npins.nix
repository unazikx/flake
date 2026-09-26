{
  zen,
  ...
}:

{
  zen.miscellaneous.npins = {
    nixos =
      {
        self,
        pkgs,
        ...
      }:
      {
        nixpkgs.overlays = [
          self.overlays.npins-sources
        ];

        environment.systemPackages = [
          pkgs.npins
        ];
      };

    homeManager =
      {
        self,
        pkgs,
        ...
      }:
      {
        nixpkgs.overlays = [
          self.overlays.npins-sources
        ];

        home.packages = [
          pkgs.npins
        ];
      };

    overlays =
      {
        self,
        ...
      }:
      {
        npins-sources = (
          _final: _prev: {
            npins-sources = import "${self}/npins";
          }
        );
      };
  };

  zen.flake-system.default = {
    includes = [ zen.miscellaneous.npins ];
  };
}

{
  inputs,
  ...
}:

{
  flake = {
    overlays = {
      system-backport = (
        _final: _prev: {
          inherit (_prev.stdenv.hostPlatform)
            system
            ;
        }
      );

      nixpkgs-branches = (
        _final: _prev:
        let
          build = rev: import rev _final._branch-config;
        in
        {
          _previous = build inputs.nixpkgs-prev;
          _stable = build inputs.nixpkgs-stable;
          _stable-prev = build inputs.nixpkgs-stable-prev;
          _unstable = build inputs.nixpkgs-unstable;

          _branch-config = {
            inherit (_final)
              system
              ;
            config = {
              inherit (_prev.config)
                allowBroken
                allowInsecure
                allowUnfree
                ;
            };
          };
        }
      );
    };
  };
}

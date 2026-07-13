{
  inputs,
  lib,
  ...
}:

{
  zen.miscellaneous.nix.overlays = [
    {
      description = ''
        nixpkgs branches builder
        _final -> final attr set where already we have something
        _old -> old final attr set where we have a blank overlays
      '';

    }
    (lib.genAttrs
      [
        "os"
        "homeManager"
      ]
      (_: {
        nixpkgs.overlays = [
          (
            _final: _prev:
            let
              inherit (_prev.stdenv.hostPlatform) system;
              build-branch = branch: import branch _final.branch-config;
            in
            {
              # WARN:
              # for fallback compatibility
              inherit system;

              _previous = build-branch inputs.nixpkgs-unstable-prev;
              _stable = build-branch inputs.nixpkgs-stable;
              _stable-prev = build-branch inputs.nixpkgs-stable-prev;

              branch-config = {
                inherit system;
                config = {
                  inherit (_prev.config)
                    allowBroken
                    allowInsecure
                    allowUnfree
                    ;
                };
              };

              proton-ge-bin-patched = _final._stable.proton-ge-bin.overrideAttrs {
                pname = "proton-ge-bin-patched";

                dontUnpack = false;
                installPhase = ''
                  runHook preInstall
                  echo "proton-ge-bin should not be installed into environments." > $out
                  mkdir $steamcompattool
                  cp -r . $steamcompattool/
                  runHook postInstall
                '';

                patches = [
                  (_prev.writeText "proton-symlink.patch"
                    # patch
                    ''
                      --- a/proton  2026-04-01 19:25:30.685223296 +0200
                      +++ b/proton  2026-04-01 19:25:30.706175835 +0200
                      @@ -932,12 +932,12 @@
                                       # wine builtin dll
                                       # make the destination an absolute symlink
                                       contents = os.path.normpath(os.path.join(os.path.dirname(src), contents))
                      -            if dll_copy:
                      -                try_copyfile(src, dst)
                      -            else:
                      -                os.symlink(contents, dst)
                      +            os.symlink(contents, dst)
                               else:
                      -            try_copyfile(src, dst)
                      +            if src.endswith(('.dll', '.exe', '.DLL', '.EXE', '.drv', '.ds', '.acm', '.ocx', '.ax', '.sys', '.cpl')):
                      +                os.symlink(src, dst)
                      +            else:
                      +                try_copyfile(src, dst)
                       
                           def copy_pfx(self):
                               with open(self.tracked_files_file, "w") as tracked_files:
                    ''
                  )
                ];
              };
            }
          )
        ];
      })
    )
  ];
}

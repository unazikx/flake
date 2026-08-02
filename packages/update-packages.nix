{
  writeShellApplication,
  jq,
  nix,
  nix-update,
  system,
  lib,
}:

writeShellApplication {
  name = "update-packages";

  runtimeInputs = [
    jq
    nix
    nix-update
  ];

  text = ''
    # list all packages
    mapfile -t packages < <(
      nix eval --json ".#packages.${system}" \
        --apply 'ps: builtins.attrNames ps' |
        jq -r '.[]'
    )

    # update every sibgle package
    for pkg in "''${packages[@]}"; do
      nix eval \
        ".#packages.${system}.$pkg.version" > /dev/null 2>&1 || continue

      echo "==> updating $pkg"

      if nix-update --quiet --flake "$pkg" > /dev/null 2>&1; then
        echo "    !!! success"
      else
        echo "    !!! failed"
      fi
    done
  '';

  meta = {
    description = "Simple mass-updater for Nix packages";
    homepage = "https://github.com/Mic92/nix-update";
    license = lib.licenses.mit;
    mainProgram = "update-packages";
  };
}

{
  _stable,
  ...
}:

_stable.proton-ge-bin.overrideAttrs {
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
    ./decrease-prefix-size.patch
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;
}

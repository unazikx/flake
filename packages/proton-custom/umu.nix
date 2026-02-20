{
  pkgs,
}:

# stable

(pkgs.proton-ge-bin.overrideAttrs (final: {
  pname = "proton-umu";
  version = "9.0-4e";

  src = pkgs.fetchzip {
    url = "https://github.com/Open-Wine-Components/umu-proton/releases/download/UMU-Proton-${final.version}/UMU-Proton-${final.version}.tar.gz";
    sha256 = "sha256-YwrDmdNEeqE4DCnfEgo1bQv0GnMqaP0PcbVyV2JLbEE=";
  };
})).override
  { steamDisplayName = "Proton-UMU"; }

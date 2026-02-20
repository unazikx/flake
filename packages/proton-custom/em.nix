{
  pkgs,
}:

# ntsync

(pkgs.proton-ge-bin.overrideAttrs (final: {
  pname = "proton-em";
  version = "10.0-24";

  src = pkgs.fetchzip {
    url = "https://github.com/Etaash-mathamsetty/Proton/releases/download/EM-${final.version}/proton-EM-${final.version}.tar.xz";
    sha256 = "sha256-fgE/J88LzIE/nLTcpaiUAvBvwtAe+m1E0JW+Eq9W2a0=";
  };
})).override
  { steamDisplayName = "Proton-EM"; }

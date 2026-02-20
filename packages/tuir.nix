{
  pkgs,
}:

pkgs.tuir.overrideAttrs (old: {
  version = "1.32.0";

  src = pkgs.fetchFromGitLab {
    owner = "Chocimier";
    repo = "tuir";
    rev = "v${old.version}";
    hash = "sha256-lUK6gXwvVjiYrJXMSFlzp07Yt+nSkU933J4vBJWOLlg=";
  };
})

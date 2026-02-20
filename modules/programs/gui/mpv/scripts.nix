{
  pkgs,
  ...
}:

let
  buildScript =
    pname: attrs:
    pkgs.mpvScripts.buildLua {
      inherit pname;
      version = "unstable";
      src = pkgs.fetchFromGitHub attrs;
    };
in

[
  (pkgs.mpvScripts.quality-menu.override { oscSupport = true; })
  pkgs.mpvScripts.sponsorblock-minimal
  pkgs.mpvScripts.thumbnail
]
++ [
  (buildScript "navigator" {
    owner = "jonniek";
    repo = "mpv-filenavigator";
    rev = "51242195da9b3231ab7fde367a63dc58fb6858f3";
    hash = "sha256-JjYDBdoPcNH+SVbOIFICJSM1sH6t6IEA2yHnHMbHpV8=";
  })
]

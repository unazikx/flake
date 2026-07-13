{
  ...
}:

{
  zen.programs.gui.mpv.scripts = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.mpv.scripts = [
          pkgs.mpvScripts.sponsorblock-minimal
          pkgs.mpvScripts.thumbnail

          (pkgs.mpvScripts.quality-menu.override {
            oscSupport = true;
          })

          (pkgs.mpvScripts.buildLua {
            pname = "navigator";
            version = "git";
            src = pkgs.fetchFromGitHub {
              owner = "jonniek";
              repo = "mpv-filenavigator";
              rev = "51242195da9b3231ab7fde367a63dc58fb6858f3";
              hash = "sha256-JjYDBdoPcNH+SVbOIFICJSM1sH6t6IEA2yHnHMbHpV8=";
            };
          })
        ];
      };
  };
}

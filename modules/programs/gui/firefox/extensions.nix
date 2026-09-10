{
  ...
}:

{
  zen.programs.gui.firefox.extensions = {
    homeManager =
      {
        self',
        user,
        ...
      }:
      let
        extensions = self'.legacyPackages.firefox-addons;
      in
      {
        programs.firefox = {
          profiles.${user.userName} = {
            extensions = {
              force = true;

              packages = [
                # keep-sorted start
                extensions.sponsorblock
                extensions.torrserver-adder
                extensions.traduzir-paginas-web
                extensions.ublock-origin
                # keep-sorted end
              ];
            };
          };
        };
      };
  };
}

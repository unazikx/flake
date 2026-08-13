{
  ...
}:

{
  zen.services.nitter = {
    description = ''
      selfhosted frontend for xcom (twitter)
      elon musk is erectus muskuini
    '';

    nixos =
      {
        self',
        config,
        ...
      }:
      {
        services.nitter = {
          enable = true;

          openFirewall = true;

          server = {
            staticDir = toString (
              self'.packages.nitter-assets.override {
                colors = config.lib.stylix.colors.withHashtag;
              }
            );
          };

          preferences = {
            theme = "Stylix";
          };

          config = {
            base64Media = true;
            enableRSS = true;
          };
        };
      };
  };
}

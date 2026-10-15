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
            staticDir =
              (self'.packages.nitter-assets.override {
                colors = config.lib.stylix.colors.withHashtag;
              })
              |> toString;
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

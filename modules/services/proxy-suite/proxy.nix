{
  ...
}:

{
  zen.services.proxy-suite.proxy = {
    nixos =
      {
        config,
        ...
      }:
      {
        services.proxy-suite = {
          proxy = {
            enable = true;

            port = 1080;
            selection = "selector";

            singBox = {
              enable = true;
            };

            tun = {
              enable = true;
              perApp.enable = true;
            };

            # INFO:
            # proxy-ctl select <tag>
            outbounds = [
              {
                tag = "Finland";
                urlFile = config.sops.secrets."vpn/finland".path;
              }
            ];
          };
        };
      };
  };
}

# INFO:
# local MTProto proxy for Telegram

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          services.tg-ws-proxy = {
            enable = true;

            host = "127.0.0.1";
            port = 1443;

            dcIps = [
              "149.154.175.50"
              "149.154.167.51"
              "149.154.175.100"
              "149.154.167.91"
              "149.154.171.5"
            ];

            secret = "023fc0b32867d70e8d6ee030721b64db";
          };
        };
    };
}

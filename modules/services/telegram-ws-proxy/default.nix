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

            # dcIps = ...;

            secret = "023fc0b32867d70e8d6ee030721b64db";
          };
        };
    };
}

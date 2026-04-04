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
          };
        };
    };
}

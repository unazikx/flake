{
  ...
}:

{
  zen.services.proxy-suite.proxy = {
    nixos =
      {
        ...
      }:
      {
        services.proxy-suite = {
          proxy = {
            enable = true;

            selection = "selector";

            listener = {
              address = "0.0.0.0";
              port = 1020;
            };
          };
        };
      };
  };
}

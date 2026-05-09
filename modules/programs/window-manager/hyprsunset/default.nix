# # WARN:
# unmaintained
# i will never use it again
#
# INFO:
# blue filter
# for eyes saver

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
          hm.services.hyprsunset = {
            enable = true;

            settings = {
              max-gamma = 150;

              profile = [
                {
                  time = "7:30";
                  identity = true;
                }
                {
                  time = "21:00";
                  temperature = 4500;
                  gamma = 0.8;
                }
              ];
            };
          };
        };
    };
}

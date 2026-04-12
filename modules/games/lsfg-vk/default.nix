# INFO:
# lossless scaling frame generation on linux

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
          services.lsfg-vk = {
            enable = true;
            ui.enable = true;
          };
        };
    };
}

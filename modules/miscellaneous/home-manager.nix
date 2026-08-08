{
  self,
  inputs,
  ...
}:

{
  zen.miscellaneous.home-manager = {
    os =
      {
        ...
      }:
      {
        home-manager.extraSpecialArgs = {
          inherit
            self
            inputs
            ;
        };
      };
  };
}

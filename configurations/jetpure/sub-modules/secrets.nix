{
  ...
}:

{
  zen.users.nixzoid = {
    nixos =
      {
        lib,
        config,
        user,
        ...
      }:
      {
        sops.age.keyFile =
          let
            home = config.users.users.${user.userName}.home;
          in
          "${home}/.config/sops/age/keys.txt";

        sops.secrets = lib.mkMerge [
          (lib.genAttrs
            [
              "programs/cachix"
              "programs/github"
            ]
            (_: {
              owner = user.userName;
            })
          )
          (lib.genAttrs
            [
              "password"
              "services/sunsetr"
              "services/telegram-ws"
            ]
            (_: {
              owner = user.userName;
              sopsFile = ../secrets.yaml;
            })
          )
        ];
      };
  };
}

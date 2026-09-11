{
  zen,
  ...
}:

{
  zen.custom.sopsnix = {
    description = ''
      https://github.com/moeleak/flakes/blob/d779c5710b4f81187c2901597e9cd6e5ab5e0058/system/sops.nix#L83
    '';

    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        meta = zen.miscellaneous.sopsnix.meta;
        pcscd = config.services.pcscd;
      in
      {
        config = lib.mkIf pcscd.enable {
          system.activationScripts = {
            setupPcscd.text =
              # bash
              ''
                PATH=$PATH:${lib.makeBinPath [ pkgs.age-plugin-yubikey ]}
                ${pkgs.runtimeShell} -c "mkdir -p /var/lib/pcsc && ln -sfn ${pkgs.ccid}/pcsc/drivers /var/lib/pcsc/drivers"
                ${pkgs.toybox}/bin/pgrep pcscd > /dev/null && ${pkgs.toybox}/bin/pkill pcscd
                ${pkgs.pcsclite}/bin/pcscd
              '';

            setupYubikeyIdentify = {
              deps = [ "setupPcscd" ];
              text =
                # bash
                ''
                  DEST='${meta.dir}/sops-yubikey'
                  ${lib.getExe pkgs.age-plugin-yubikey} --identity > $DEST
                '';
            };

            setupSecrets.deps = [ "setupPcscd" ];
            setupSecretsForUsers.deps = [ "setupPcscd" ];
          };
        };
      };
  };
}

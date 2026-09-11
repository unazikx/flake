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
        pcscd = config.services.pcscd;
      in
      {
        config = lib.mkIf pcscd.enable {
          system.activationScripts = {
            setupYubikeyForSopsNix.text =
              # bash
              ''
                PATH=$PATH:${lib.makeBinPath [ pkgs.age-plugin-yubikey ]}
                ${pkgs.runtimeShell} -c "mkdir -p /var/lib/pcsc && ln -sfn ${pkgs.ccid}/pcsc/drivers /var/lib/pcsc/drivers"
                ${pkgs.toybox}/bin/pgrep pcscd > /dev/null && ${pkgs.toybox}/bin/pkill pcscd
                ${pkgs.pcsclite}/bin/pcscd
              '';

            setupSecrets.deps = [ "setupYubikeyForSopsNix" ];
            setupSecretsForUsers.deps = [ "setupYubikeyForSopsNix" ];
          };
        };
      };
  };
}

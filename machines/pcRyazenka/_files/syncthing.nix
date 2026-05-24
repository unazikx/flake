{
  lib,
  ...
}:

{
  hm.services.syncthing.settings.devices =
    with lib.mkSyncthing;
    lib.listToAttrs [
      (device "nothing2a" "E2PI7IQ-ZCKQW2J-MQF4OYZ-MFEPN4T-NNMF3LP-2TEHSM3-ZIN5VW2-6CRSRQM")
      (device "blackmamba" "3PWM3G4-KOBIRI7-ZSS63JJ-EWQX5VX-BC5F772-76CZATP-XBP6QOX-HFCGPQN")
      (device "windauser" "5NRFLQO-KFR4H7P-XGWMLNH-PSYDTNL-CF2D6JZ-PNEK76R-6DSYGSS-ZTFWQQF")
    ];
}

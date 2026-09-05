(import ./secrets/agenix-foldl.nix) {
  jetpure = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEfKdaun/zwSaiO5eXumW73numZz8PiZn2nJKO20qYjn";
    secrets = [
      "vpn/cf-warp"
    ];
  };

  nixzoid = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRUwtclBrPdWkOW0B7x/1jA26qObmURF9A8F9Tyqlmg";
    secrets = [ ];
  };

  blackmamba = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB0+usM2xVKz1g72qPS9sCDq8EHpSDpbLCFna84dANJN";
    secrets = [ ];
  };

  hikkamori = {
    key = "...";
    secrets = [ ];
  };
}

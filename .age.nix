(import ./secrets/agenix-foldl.nix) {
  jetpure = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRUwtclBrPdWkOW0B7x/1jA26qObmURF9A8F9Tyqlmg";
    secrets = [
      "vpn/cf-warp"
    ];
  };
}

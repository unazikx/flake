{
  rustPlatform,
  fetchFromGitHub,
  lib,
}:

rustPlatform.buildRustPackage {
  pname = "niri-sidebar";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "vigintillionn";
    repo = "niri-sidebar";
    rev = "83603353eceb51a0a1d889b17713000dcb222794";
    hash = "sha256-YDNugm3RQ65tN0jYdD0sO//AWYGJ+P+WP8APu40r2fM=";
  };

  cargoHash = "sha256-13gDpYcG0gB35zu8pzKUuSRvTc10cCjWQkIg42zejpc=";

  meta = {
    description = "Lightweight external sidebar manager for the Niri window manager";
    homepage = "https://github.com/Vigintillionn/niri-sidebar";
    license = lib.licenses.mit;
    mainProgram = "niri-sidebar";
  };
}

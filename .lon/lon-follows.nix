# Written by flake-file from flake-file.inputs; do not edit.
# The follows declared there, for with-inputs: pass this file as (or with) its overrides.
{
  disko.inputs.nixpkgs.follows = "nixpkgs";
  erosanix.inputs.nixpkgs.follows = "nixpkgs";
  flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  hjem.inputs.nixpkgs.follows = "nixpkgs";
  hjem-rum.inputs = {
    hjem.follows = "hjem";
    nixpkgs.follows = "nixpkgs";
  };
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
  microvm-nix.inputs = {
    nixpkgs.follows = "nixpkgs";
    spectrum.follows = "spectrum";
  };
  nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  nix-math.inputs = {
    flake-parts.follows = "flake-parts";
    nixpkgs.follows = "nixpkgs";
  };
  nix-minecraft.inputs.nixpkgs.follows = "nixpkgs";
  nixos-cli.inputs = {
    flake-parts.follows = "flake-parts";
    nixpkgs.follows = "nixpkgs";
    optnix.follows = "optnix";
  };
  nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";
  nur.inputs = {
    flake-parts.follows = "flake-parts";
    nixpkgs.follows = "nixpkgs";
  };
  proxy-suite-flake.inputs.nixpkgs.follows = "nixpkgs";
  sopsnix.inputs.nixpkgs.follows = "nixpkgs";
  spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
  steam-config-nix.inputs = {
    flake-parts.follows = "flake-parts";
    nixpkgs.follows = "nixpkgs";
  };
  stylix.inputs = {
    flake-parts.follows = "flake-parts";
    nixpkgs.follows = "nixpkgs";
    nur.follows = "nur";
  };
  umbriel.inputs.nixpkgs.follows = "nixpkgs";
  winapps.inputs = {
    flake-utils.follows = "flake-utils";
    nixpkgs.follows = "nixpkgs";
  };
  xmcl.inputs.nixpkgs.follows = "nixpkgs";
}

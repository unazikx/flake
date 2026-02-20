{
  inputs,
  pkgs,
  lib,
}:

(inputs.nvf.lib.neovimConfiguration {
  inherit
    pkgs
    ;

  # modules =
  #   (import ../../xlib/options/default.nix {
  #     inherit
  #       pkgs
  #       lib
  #       ;
  #   }).umport
  #     { path = ./config; };
}).neovim

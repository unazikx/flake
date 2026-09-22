{
  inputs,
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    erosanix = {
      type = "github";
      owner = "emmanuelrosa";
      repo = "erosanix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.windows-apps = {
    nixos =
      {
        inputs',
        ...
      }:
      {
        environment.systemPackages = [
          inputs'.erosanix.packages.winerun-wineWow64-base-vulkan
        ];
      };

    root =
      {
        system,
        ...
      }:
      {
        _module.args = {
          mkApp = inputs.erosanix.lib.${system}.mkWindowsApp;
        };
      };
  };

  zen.flake-parts.default = {
    includes = [
      zen.games.windows-apps
    ];
  };
}

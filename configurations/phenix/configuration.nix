{
  zen,
  ...
}:

{
  den.hosts.phenix = {
    system = "x86_64-linux";
    class = "finix";

    users = {
      jeensgrys = {
        classes = [ "hjem" ];
      };
    };
  };

  zen.hosts.phenix = {
    includes = [
      zen.miscellaneous.nix
    ];

    finix =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.finix-community.nixosModules.minimal
        ];

        profiles.minimal = {
          enable = true;
          deviceManager = "udev";
        };
      };
  };

  zen.users.jeensgrys = {
    includes = [ ];
  };
}

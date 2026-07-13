{
  den,
  lib,
  ...
}:

{
  # description = ''
  #   idk, i wont use that

  #   reference:
  #   https://github.com/sini/nix-config/blob/main/modules/den/classes/home-platform.nix

  #   Pattern imports for specific systems,
  #   between different os platforms
  # '';

  den.classes = {
    nixosStylix.description = "Stylix modules for Linux hosts";
    darwinStylix.description = "Stylix modules for Darwin hosts";
    homeManagerStylix.description = "Stylix modules for Darwin hosts";
  };

  den.policies = {
    nixosStylix =
      {
        host,
        ...
      }:
      lib.optional (host.class == "nixos") (
        den.lib.policy.route {
          fromClass = "nixosStylix";
          intoClass = "nixos";
          path = [ ];
        }
      );

    darwinStylix =
      {
        host,
        ...
      }:
      lib.optional (host.class == "darwin") (
        den.lib.policy.route {
          fromClass = "darwinStylix";
          intoClass = "darwin";
          path = [ ];
        }
      );

    homeManagerStylix =
      {
        user,
        ...
      }:
      lib.optional (lib.elem "homeManager" user.classes) (
        den.lib.policy.route {
          fromClass = "homeManagerStylix";
          intoClass = "homeManager";
          path = [ ];
        }
      );
  };

  den.schema.host.includes = [
    den.policies.nixosStylix
    den.policies.darwinStylix
  ];

  den.schema.user.includes = [
    den.policies.homeManagerStylix
  ];

  den.schema.home.includes = [
    den.policies.homeManagerStylix
  ];
}

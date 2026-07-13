{
  den,
  lib,
  ...
}:
{
  # description = ''
  #   reference:
  #   https://github.com/sini/nix-config/blob/main/modules/den/classes/home-platform.nix

  #   Pattern when need home-manager to distinguish
  #   between different os platforms
  # '';

  den.classes = {
    homeManagerNixos.description = "HomeManager modules for Linux hosts";
    homeManagerDarwin.description = "HomeManager modules for Darwin hosts";
    homeManagerOS.description = "HomeManager modules for Darwin and Linux hosts";
    homeManagerStandalone.description = "HomeManager modules for Home configurations";
  };

  den.policies = {
    homeManagerNixos =
      {
        host,
        ...
      }:
      lib.optional (host.class == "nixos") (
        den.lib.policy.route {
          fromClass = "homeManagerNixos";
          intoClass = "homeManager";
          path = [ ];
        }
      );

    homeManagerDarwin =
      {
        host,
        ...
      }:
      lib.optional (host.class == "darwin") (
        den.lib.policy.route {
          fromClass = "homeManagerDarwin";
          intoClass = "homeManager";
          path = [ ];
        }
      );

    homeManagerOS =
      {
        host,
        ...
      }:
      lib.optional (host.class == "darwin" || host.class == "darwin") (
        den.lib.policy.route {
          fromClass = "homeManagerOS";
          intoClass = "homeManager";
          path = [ ];
        }
      );

    homeManagerStandalone =
      {
        home,
        ...
      }:
      lib.optional (home.class == "homeManager") (
        den.lib.policy.route {
          fromClass = "homeManagerStandalone";
          intoClass = "homeManager";
          path = [ ];
        }
      );
  };

  den.schema.user.includes = [
    den.policies.homeManagerNixos
    den.policies.homeManagerDarwin
    den.policies.homeManagerOS
    den.policies.homeManagerStandalone
  ];
}

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
    # keep-sorted start
    homeManagerDarwin = { };
    homeManagerNixos = { };
    homeManagerOS = { };
    homeManagerStandalone = { };
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
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
    # keep-sorted end
  };

  den.schema.user.includes = [
    # keep-sorted start
    den.policies.homeManagerDarwin
    den.policies.homeManagerNixos
    den.policies.homeManagerOS
    den.policies.homeManagerStandalone
    # keep-sorted end
  ];
}

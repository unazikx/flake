{
  ...
}:

{
  zen.programs.desktop.uwsm = {
    description = ''
      wayland session manager
    '';

    nixos =
      {
        ...
      }:
      {
        programs.uwsm = {
          enable = true;
        };
      };

    homeManager =
      {
        config,
        ...
      }:
      {
        xdg.configFile = {
          "uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
        };
      };
  };
}

{
  inputs,
  den,
  ...
}:

{
  _module.args = {
    __findFile = den.lib.__findFile;
  };

  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    den = {
      type = "github";
      owner = "denful";
      repo = "den";
      ref = "main";
    };

    import-tree = {
      type = "github";
      owner = "denful";
      repo = "import-tree";
      ref = "main";
    };

    with-inputs = {
      type = "github";
      owner = "unazikx";
      repo = "with-inputs";
      ref = "main";
    };
    # keep-sorted end
  };

  imports = [
    (inputs.den.namespace "zen" true)
    inputs.den.flakeModules.default
  ];

  den.default = {
    includes = [
      # http://den.denful.dev/reference/batteries
      # keep-sorted start
      den.batteries.define-user
      den.batteries.host-aspects
      den.batteries.hostname
      den.batteries.inputs'
      den.batteries.primary-user
      den.batteries.self'
      # keep-sorted end
    ];
  };

  # zen.flake-parts.default = {
  #   packages =
  #     {
  #       pkgs,
  #       ...
  #     }:
  #     den.lib.nh.denPackages {
  #       defaultAction = "switch";
  #     } pkgs;
  # };

  debug = true;
}

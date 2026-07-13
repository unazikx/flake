{
  den,
  ...
}:

{
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
}

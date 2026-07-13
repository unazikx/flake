{
  zen,
  ...
}:

{
  zen.suites.services = {
    includes = [
      # keep-sorted start
      zen.services.caddy
      zen.services.glance
      # keep-sorted end
    ];
  };
}

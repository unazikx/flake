{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    dns-malw-link = {
      type = "github";
      owner = "immalware";
      repo = "dns.malw.link";
      flake = false;
    };
    # keep-sorted end
  };

  zen.hardware.networking.hosts = blackList: {
    description = ''
      modified dns malw link hosts file

      use module like:
      (zen.networking.hosts [ "api.github.com" ])
    '';

    nixos =
      {
        inputs,
        pkgs,
        lib,
        ...
      }:
      {
        networking.extraHosts = lib.readFile (
          pkgs.runCommandLocal "modified-hosts.txt"
            {
              source = "${inputs.dns-malw-link.outPath}/hosts";

              meta = {
                description = "DNS-server + SNI-proxy thats bypass blocks";
                homepage = "https://github.com/ImMALWARE/dns.malw.link";
                license = lib.licenses.mit;
              };
            }
            ''
              sed ${lib.concatStringsSep " " (map (domain: " -e'/.*${lib.escapeRegex domain}.*/d'") blackList)} \
                $source > $out
            ''
        );
      };
  };
}

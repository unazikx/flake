{
  ...
}:

{
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
          pkgs.runCommand "modified-hosts.txt"
            {
              preferLocalBuild = true;
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

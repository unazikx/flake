{
  zen,
  ...
}:

{
  zen.flake-parts.default = {
    includes = [
      zen.custom.wiki
      zen.games.steam
      zen.games.hytale.launcher
      zen.games.minecraft
    ];

    files =
      {
        lib,
        config,
        ...
      }:
      {
        file."wiki.md".text =
          let
            formatLinks =
              links:
              lib.concatStrings (
                map (link: ''
                  - [_${link.name}_](${link.url})
                    ![logo for ${link.name}](${toString link.logo})
                '') links
              );

            formatWiki = name: data: ''
              ## __${name}__

              ${data.extra or (toString null)}

              ${formatLinks data.links}
            '';
          in
          ''
            # Wiki for various programs, and my notes for them

            ${lib.concatStrings (
              map (name: formatWiki name config.wiki.${name}) (builtins.attrNames config.wiki)
            )}

            ## Total: ${toString (lib.length (lib.attrNames config.wiki))} wikis
          '';
      };
  };
}

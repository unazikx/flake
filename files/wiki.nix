{
  zen,
  ...
}:

{
  zen.flake-parts.default = {
    includes = [
      # keep-sorted start
      zen.custom.wiki
      zen.games.hytale.launcher
      zen.games.minecraft
      zen.games.steam
      zen.programs.desktop.noctalia
      # keep-sorted end
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
                  - <img src="${link.logo}" height="24"> ${link.name} -> ${link.url}

                    ${toString link.extra}

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

            > take icons from here:
            > https://dashboardicons.com
            > https://simpleicons.org

            ${lib.concatStrings (
              map (name: formatWiki name config.wiki.${name}) (builtins.attrNames config.wiki)
            )}

            ## Total: ${toString (lib.length (lib.attrNames config.wiki))} wikis
          '';
      };
  };
}

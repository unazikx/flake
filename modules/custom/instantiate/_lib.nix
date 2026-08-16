{
  inputs,
  ...
}:

(
  lib: _new:

  {
    stylix = {
      mkTarget = import "${inputs.stylix}/stylix/mk-target.nix";
      mkImage =
        pkgs: image: colors:
        pkgs.runCommand "stylix-image.png" { } (
          lib.concatStringsSep " " [
            (lib.getExe pkgs.lutgen)
            "apply"
            image
            "-o"
            "$out"
            "--"
            (builtins.concatStringsSep " " colors)
          ]
        );
    };

    mkGames =
      options:
      lib.mapAttrs (
        _: attrs:
        lib.mkMerge [
          options
          attrs
        ]
      );

    escapeDomains =
      listOfDomains:
      lib.concatStringsSep " " (map (domain: " -e'/.*${lib.escapeRegex domain}.*/d'") listOfDomains);

    yazi = {
      mkPluginMime =
        run: list:
        map (mime: {
          inherit
            mime
            run
            ;
        }) list;

      mkPluginUrl =
        run: list:
        map (url: {
          inherit
            url
            run
            ;
        }) list;

      mkRuleMime =
        mimes: use:
        map (mime: {
          inherit
            mime
            use
            ;
        }) mimes;

      mkRuleUrl =
        urls: use:
        map (url: {
          inherit
            url
            use
            ;
        }) urls;
    };

    gendeepINI = lib.generators.toINI {
      mkKeyValue =
        let
          separator = "=";
        in
        key: value:
        if lib.isAttrs value then
          lib.concatStringsSep "\n" (
            lib.collect lib.isString (
              lib.mapAttrsRecursive (
                path: entry:
                "${lib.escape [ separator ] (lib.concatStringsSep "\\" ([ key ] ++ path))}${separator}${
                  lib.replaceString "\n" "\\n" (lib.generators.mkValueStringDefault { } entry)
                }"
              ) value
            )
          )
        else
          lib.generators.mkKeyValueDefault { } separator key value;
    };

    mkHsl =
      config: color:
      let
        r = ((lib.toInt config."${color}-rgb-r") * 100.0) / 255;
        g = ((lib.toInt config."${color}-rgb-g") * 100.0) / 255;
        b = ((lib.toInt config."${color}-rgb-b") * 100.0) / 255;

        max = lib.max r (lib.max g b);
        min = lib.min r (lib.min g b);

        delta = max - min;
        fmod = base: int: base - (int * builtins.floor (base / int));

        h =
          if delta == 0 then
            0
          else if max == r then
            60 * (fmod ((g - b) / delta) 6)
          else if max == g then
            60 * (((b - r) / delta) + 2)
          else if max == b then
            60 * (((r - g) / delta) + 4)
          else
            0;

        s = if delta == 0 then 0 else 100 * delta / (100 - lib.max (2 * l - 100) (100 - (2 * l)));
        l = (max + min) / 2;

        roundToString = value: toString (builtins.floor (value + 0.5));
      in
      lib.concatMapStringsSep " " roundToString [
        h
        s
        l
      ];
  })

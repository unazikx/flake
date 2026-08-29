{
  inputs,
  lib,
  ...
}:

lib.extend (
  _prev: _new: {
    stylix = {
      mkTarget = import "${inputs.stylix}/stylix/mk-target.nix";
      mkImage =
        pkgs: image: colors:
        pkgs.runCommand "stylix-image.png" { } (
          _prev.concatStringsSep " " [
            (_prev.getExe pkgs.lutgen)
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
      _prev.mapAttrs (
        _: attrs:
        _prev.mkMerge [
          options
          attrs
        ]
      );

    escapeDomains =
      listOfDomains:
      _prev.concatStringsSep " " (map (domain: " -e'/.*${_prev.escapeRegex domain}.*/d'") listOfDomains);

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

    gendeepINI = _prev.generators.toINI {
      mkKeyValue =
        let
          separator = "=";
        in
        key: value:
        if _prev.isAttrs value then
          _prev.concatStringsSep "\n" (
            _prev.collect _prev.isString (
              _prev.mapAttrsRecursive (
                path: entry:
                "${_prev.escape [ separator ] (_prev.concatStringsSep "\\" ([ key ] ++ path))}${separator}${
                  _prev.replaceString "\n" "\\n" (_prev.generators.mkValueStringDefault { } entry)
                }"
              ) value
            )
          )
        else
          _prev.generators.mkKeyValueDefault { } separator key value;
    };

    mkHsl =
      config: color:
      let
        r = ((_prev.toInt config."${color}-rgb-r") * 100.0) / 255;
        g = ((_prev.toInt config."${color}-rgb-g") * 100.0) / 255;
        b = ((_prev.toInt config."${color}-rgb-b") * 100.0) / 255;

        max = _prev.max r (_prev.max g b);
        min = _prev.min r (_prev.min g b);

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

        s = if delta == 0 then 0 else 100 * delta / (100 - _prev.max (2 * l - 100) (100 - (2 * l)));
        l = (max + min) / 2;

        roundToString = value: toString (builtins.floor (value + 0.5));
      in
      _prev.concatMapStringsSep " " roundToString [
        h
        s
        l
      ];
  }
)

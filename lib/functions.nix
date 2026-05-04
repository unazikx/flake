{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  inherit (inputs.nix-math.lib)
    math
    ;

  mkSecrets = {
    sopsnix =
      list: sopsFile:
      lib.genAttrs list (_n: {
        owner = lib.userName;
        inherit sopsFile;
      });

    sopstem = filename: content: {
      ${filename} = {
        owner = lib.userName;
        group = "users";
        inherit content;
      };
    };

    agenix = throw "Agenix is not configured";
  };

  mkSymlink =
    path:
    let
      pathStr = toString path;
      name = lib.hm.strings.storeFileName (baseNameOf pathStr);
    in
    pkgs.runCommandLocal name { } "ln -s ${lib.escapeShellArg pathStr} $out";

  mkFirefoxModule = import (
    lib.concatStringsSep "/" [
      inputs.home-manager
      "modules"
      "programs"
      "firefox"
      "mkFirefoxModule.nix"
    ]
  );

  mkMime =
    assocs:
    lib.pipe assocs [
      (lib.mapAttrsToList (
        prog:
        map (type: {
          "${type}" = prog;
        })
      ))
      lib.flatten
      lib.zipAttrs
    ];

  mkStylixImage =
    image: colors:
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

  syncthing = {
    mkFilter = config: list: lib.attrNames (removeAttrs config list);

    mkDevice = name: id: {
      inherit name;
      value = {
        inherit id;
        autoAcceptFolders = true;
        compression = "always";
      };
    };

    mkFolder =
      {
        id,
        name,
        path,
        devices,
      }:
      {
        inherit name;
        value = {
          inherit id path devices;
          rescanIntervalS = 4;
          versioning = {
            type = "simple";
            params = {
              cleanupIntervalS = toString (60 * 2);
              cleanoutDays = toString (7 * 4);
              keep = toString (7 * 1);
            };
          };
        };
      };
  };

  minecraft = rec {
    formatValue =
      value:
      if builtins.isList value then
        "[${lib.concatMapStringsSep "," (x: "\"${toString x}\"") value}]"
      else if builtins.isBool value then
        (if value then "true" else "false")
      else if builtins.isString value then
        value
      else
        toString value;

    genOptions =
      options: lib.concatStringsSep "\n" (lib.mapAttrsToList (k: v: "${k}:${formatValue v}") options);
  };

  steam = {
    mkAttrset =
      options:
      lib.mapAttrs (
        _: attrs:
        lib.mkMerge [
          options
          attrs
        ]
      );
  };
}

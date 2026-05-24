{
  self,
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
    fromFile =
      list: sopsFile:
      lib.genAttrs list (_n: {
        owner = lib.userName;
        inherit sopsFile;
      });

    template = filename: content: {
      ${filename} = {
        owner = lib.userName;
        group = "users";
        inherit content;
      };
    };
  };

  mkSymlink =
    path:
    let
      pathStr = toString path;
      name = lib.hm.strings.storeFileName (baseNameOf pathStr);
    in
    pkgs.runCommandLocal name { } ''
      ln -s ${lib.escapeShellArg pathStr} $out
    '';

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

  mkStylix = {
    image =
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

    theme = name: import "${self}/modules/themes/base16/${name}.nix";
  };

  mkSyncthing = {
    filter = config: list: lib.attrNames (removeAttrs config list);

    device = name: id: {
      inherit name;
      value = {
        inherit id;
        autoAcceptFolders = true;
        compression = "always";
      };
    };

    folder =
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

  mkMinecraft =
    let
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
    in
    {
      genOptions =
        options:
        lib.concatStringsSep "\n" (lib.mapAttrsToList (key: value: "${key}:${formatValue value}") options);
    };

  mkSteam = {
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

  mkDevices = {
    byName =
      list:
      lib.listToAttrs (
        map (name: {
          name = "/media/${name}";
          value =
            (
              {
                name ? throw "set label pls",
                options ? [ ],
              }:
              {
                device = "/dev/disk/by-label/${name}";
                fsType = "ext4";
                inherit options;
              }
            )
              {
                inherit name;
                options = [ "x-gvfs-show" ];
              };
        }) list
      );
  };

  mkSpecialisations = {
    fromDirectories =
      directory: args:
      let
        specializationsList = (
          lib.attrNames (lib.filterAttrs (_path: type: type == "regular") (lib.readDir directory))
        );

        nameFromFile = lib.removeSuffix ".nix";
      in
      lib.listToAttrs (
        map (filename: {
          name = nameFromFile filename;
          value =
            (
              name:
              {
                configuration = {
                  system.nixos.tags = [ name ];
                  imports = [ ./${name}.nix ];
                };
              }
              // args
            )
              (nameFromFile filename);
        }) specializationsList
      );
  };
}

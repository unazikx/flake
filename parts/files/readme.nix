{
  ...
}:

{
  perSystem =
    {
      ...
    }:
    {
      files.file."readme.md" = {
        text = ''
          <div align="center">
            <h1>【 nixos configuration 】</h1>
          </div>

          ### structure:

          |                 path | description                                    |
          | -------------------: | :--------------------------------------------- |
          |      **./flake.nix** | _inputs_ and _flake-parts_ outputs import-tree |
          | **./configurations** | declare homes, hosts and users                 |
          |        **./modules** | modules, aspects and other utils               |
          |          **./parts** | _flake-parts_ tools and devshells              |

          ### todo:

          1. move _flake.nix_ to _npins_
          2. add _schema_ for _[nvf](https://nvf.notashelf.dev/)_
          3. spizdit mnogo moduley u drugih

          ### [previous flake structure](https://github.com/unazikx/flake/tree/4b5dfcc5da3f69a271e8a1d4e4d5479b14f699cc)
        '';
      };
    };
}

{
  pkgs,
  lib,
  ...
}:

let
  vs = n: "vscode-${n}-language-server";

  auto-format = true;
  indent = {
    tab-width = 2;
    unit = "  ";
  };
in

{
  language = [
    {
      # nix
      inherit auto-format indent;
      name = "nix";

      language-servers = [ "nixd" ];

      formatter = {
        command = lib.getExe pkgs.nixfmt;
      };
    }
    {
      # html
      inherit auto-format indent;
      name = "html";

      language-servers = [ "vscode-html" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "html"
        ];
      };
    }
    {
      # json
      inherit auto-format indent;
      name = "json";

      language-servers = [ "vscode-json" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "json"
        ];
      };
    }
    {
      # jsonc
      inherit auto-format indent;
      name = "jsonc";

      language-servers = [ "vscode-json" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "json"
        ];
      };
    }
    {
      # css
      inherit auto-format indent;
      name = "css";

      language-servers = [ "vscode-css" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "css"
        ];
      };
    }
    {
      # scss
      inherit auto-format indent;
      name = "scss";

      language-servers = [ "vscode-css" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "scss"
        ];
      };
    }
    {
      # markdown
      inherit auto-format indent;
      name = "markdown";

      language-servers = [ "marksman" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "markdown"
        ];
      };
    }
    {
      # typescript
      inherit auto-format indent;
      name = "typescript";

      language-servers = [ "typescript" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "typescript"
        ];
      };
    }
    {
      # typescript
      inherit auto-format indent;
      name = "tsx";

      language-servers = [ "typescript" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "typescript"
        ];
      };
    }
    {
      # yaml
      inherit auto-format indent;
      name = "yaml";

      language-servers = [ "yaml" ];

      formatter = {
        command = lib.getExe pkgs.nodePackages_latest.prettier;
        args = [
          "--use-tabs"
          "--parser"
          "yaml"
        ];
      };
    }
    {
      # python
      inherit auto-format indent;
      name = "python";

      language-servers = [
        "pylsp"
        "pyright"
      ];

      file-types = [
        "py"
        "pyi"
        "py3"
        "pyw"
        ".pythonstartup"
        ".pythonrc"
      ];

      roots = [
        "."
        "pyproject.toml"
        "pyrightconfig.json"
      ];

      comment-token = "#";
      scope = "source.python";
      injection-regex = "python";

      formatter = {
        command = lib.getExe pkgs.black;
        args = [
          "--use-tabs"
          "--parser"
          "python"
        ];
      };
    }
  ];

  language-server = {
    nixd =
      let
        flake = "(builtins.getFlake (toString ${lib.flakeDir}))";
      in
      {
        command = lib.getExe pkgs.nixd;

        diagnostic.suppress = [ "sema-extra-with" ];

        config.nixd = {
          nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";

          options = rec {
            "nixos".expr = "${flake}.nixosConfigurations.${lib.configurationName}.options";
            "home-manager".expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
          };

          diagnostic.suppress = [ "sema-extra-with" ];
        };
      };
  } # nix
  // {
    typescript.command = lib.getExe pkgs.typescript-language-server;
  } # typescript
  // {
    yaml.command = lib.getExe pkgs.yaml-language-server;
  } # typescript
  // {
    marksman.command = lib.getExe pkgs.marksman;
  } # markdown
  // {
    vscode-html.command = lib.getExe' pkgs.vscode-langservers-extracted (vs "html");
    vscode-json.command = lib.getExe' pkgs.vscode-langservers-extracted (vs "json");
    vscode-css.command = lib.getExe' pkgs.vscode-langservers-extracted (vs "css");
  } # vscode <lang> server
  // {
    pylsp.command = lib.getExe pkgs.python312Packages.python-lsp-server;

    pyright = {
      command = lib.getExe pkgs.pyright;

      args = [ "--stdio" ];

      config = {
        reportMissingTypeStubs = false;

        python.analysis = {
          typeCheckingMode = "basic";
          autoImportCompletions = true;
        };
      };
    };
  } # python
  ;
}

{
  lib,
  ...
}:

let
  auto-format = true;
  indent = {
    tab-width = 2;
    unit = "  ";
  };
in

{
  language = [
    {
      inherit auto-format indent;
      name = "nix";

      language-servers = [ "nixd" ];

      formatter = {
        command = "nixfmt";
      };
    }
    {
      inherit auto-format indent;
      name = "json";

      language-servers = [ "vscode-json-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "json"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "jsonc";

      language-servers = [ "vscode-json-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "json"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "css";

      language-servers = [ "vscode-css-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "css"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "scss";

      language-servers = [ "vscode-css-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "scss"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "markdown";

      language-servers = [ "marksman" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "markdown"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "typescript";

      language-servers = [ "typescript-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "typescript"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "tsx";

      language-servers = [ "typescript-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "typescript"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "yaml";

      language-servers = [ "yaml-language-server" ];

      formatter = {
        command = "prettier";
        args = [
          "--use-tabs"
          "--parser"
          "yaml"
        ];
      };
    }
    {
      inherit auto-format indent;
      name = "python";

      language-servers = [ "python-lsp-server" ];

      formatter = {
        command = "black";
      };
    }
    {
      inherit auto-format indent;
      name = "go";

      language-servers = [
        "gopls"
        "golangci-lint-langserver"
        "codebook"
      ];

      formatter = {
        command = "gofmt";
      };
    }
  ];

  language-server = lib.mkMerge [
    {
      nixd =
        let
          flake = "(builtins.getFlake (toString ${lib.flakeDir}))";
        in
        {
          config.nixd = {
            nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";

            options = rec {
              "nixos".expr = "${flake}.nixosConfigurations.${lib.configurationName}.options";
              "home-manager".expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
            };
          };
        };
    }
  ];
}

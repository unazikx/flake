{
  ...
}:

{
  zen.programs.editors.helix.languages = {
    homeManager =
      {
        ...
      }:
      {
        programs.helix.languages = {
          language =
            map
              (
                params:
                params
                // {
                  auto-format = true;
                  indent = {
                    tab-width = 2;
                    unit = "  ";
                  };
                }
              )
              [
                {
                  name = "nix";

                  language-servers = [ "nixd" ];

                  formatter = {
                    command = "nixfmt";
                  };
                }
                {
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
                  name = "tsx";

                  language-servers = [ "typescript-language-server" ];

                  language-id = "typescriptreact";
                  file-types = [ "tsx" ];

                  workspace-lsp-roots = [
                    "tsconfig.json"
                    "package.json"
                    "."
                  ];

                  roots = [
                    "tsconfig.json"
                    "package.json"
                    "."
                  ];

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
                  name = "python";

                  language-servers = [ "pylsp" ];

                  formatter = {
                    command = "black";
                  };
                }
                {
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
        };
      };
  };
}

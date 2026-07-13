{
  ...
}:

{
  zen.programs.editors.zed.plugins = {
    homeManager =
      {
        ...
      }:
      {
        programs.zed-editor.extensions = [
          # keep-sorted start
          "csv"
          "desktop"
          "fish"
          "glsl"
          "go-snippets"
          "html"
          "ini"
          "jq"
          "json5"
          "just"
          "kotlin"
          "latex"
          "lua"
          "markdown-snippets"
          "marksman"
          "material-icon-theme"
          "mdx"
          "nix"
          "nu"
          "todotxt"
          "toml"
          # keep-sorted end
        ];
      };
  };
}

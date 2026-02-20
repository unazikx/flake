{
  pkgs,
  lib,
}:

pkgs.yaziPlugins.mkYaziPlugin {
  pname = "save-clipboard-to-file.yazi";
  version = "git";

  src = pkgs.fetchFromGitHub {
    owner = "boydaihungst";
    repo = "save-clipboard-to-file.yazi";
    rev = "40de82fec9f46d3c3d1dc8907d0ca3fa6ca8c8f1";
    hash = "sha256-5wtSjwg6RvbIuODwQOHJ+bHhPjhn0UyRWzPngdS8uQM=";
  };

  meta = {
    description = "Yazi plugin to paste clipboard content to file";
    homepage = "https://github.com/boydaihungst/save-clipboard-to-file.yazi";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ azikx ];
  };
}

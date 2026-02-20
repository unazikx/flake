{
  pkgs,
  lib,
}:

pkgs.yaziPlugins.mkYaziPlugin {
  pname = "glow.yazi";
  version = "git";

  src = pkgs.fetchFromGitHub {
    owner = "tiejunhu";
    repo = "glow.yazi";
    rev = "eec50c71586e1649b6655d9a2d349cec245280e8";
    hash = "sha256-ppsYr26T3iF5UVFq+EPIe/Ai7GgAj0Ry1yu0440tQtc=";
  };

  meta = {
    description = "Glow preview plugin for yazi";
    homepage = "https://github.com/tiejunhu/glow.yazi";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ azikx ];
  };
}

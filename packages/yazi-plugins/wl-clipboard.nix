{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "wl-clipboard.yazi";
  version = "git";

  src = fetchFromGitHub {
    owner = "alterkeyy";
    repo = "wl-clipboard.yazi";
    rev = "a22bb04181c4e391a9f474dbba4a866888c73974";
    hash = "sha256-v7SDA85NAQ6jhB6CELrlXyzi4X+zMgBSdu+Zb7s4DCI=";
  };

  meta = {
    description = "Simple system clipboard for yazi";
    homepage = "https://github.com/alterkeyy/wl-clipboard.yazi";
    license = lib.licenses.mit;
  };
}

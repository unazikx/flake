{
  pkgs,
  lib,
}:

pkgs.yaziPlugins.mkYaziPlugin {
  pname = "wl-clipboard.yazi";
  version = "git";

  src = pkgs.fetchFromGitHub {
    owner = "unazikx";
    repo = "wl-clipboard.yazi";
    rev = "e3eb54b8d7d2e79d53db90bdb509211d7bceae2f";
    hash = "sha256-7eJjNJyC6q+foCF48lwtjCt8fKqHfRWebbp7ymEb5NE=";
  };

  meta = {
    description = "Simple system clipboard for yazi";
    homepage = "https://github.com/unazikx/wl-clipboard.yazi";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ unazikx ];
  };
}

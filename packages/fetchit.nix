{
  stdenv,
  fetchFromGitea,
  pkg-config,
  lua,
  lib,
}:

stdenv.mkDerivation (_old: {
  pname = "fetchit";
  version = "git";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "nzuum";
    repo = "fetchit";
    rev = "25fd005f39087ba6b41bdf897b0ca4063dfb4def";
    hash = "sha256-0+OjyIHQ+gf/d11ZPLYjpV4qqBzZU/WfEfnmamZ9jYU=";
  };

  nativeBuildInputs = [
    pkg-config
    lua
  ];

  installFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "Simple system fetcher";
    homepage = "https://codeberg.org/nzuum/fetchit";
    license = lib.licenses.bsd3ClauseTso;
  };
})

{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "convert";
  version = "git";

  src = fetchFromGitHub {
    owner = "JohWQ";
    repo = "convert.yazi";
    rev = "91b921a0430c3670437b680e2fbf5ce66ea61d93";
    hash = "sha256-bWhqg8m6Ea19JI8gYg7H6oC0Ely+ky9ck/jT6oUEKNQ=";
  };

  meta = {
    description = "Yazi plugin to convert images";
    homepage = "https://github.com/JohWQ/convert.yazi";
    license = lib.licenses.mit;
  };
}

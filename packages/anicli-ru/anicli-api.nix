{
  pkgs,
  ...
}:

with pkgs.python312Packages;

buildPythonApplication rec {
  pname = "anicli_api";
  version = "0.8.11";
  pyproject = true;

  src = pkgs.fetchPypi {
    inherit
      pname
      version
      ;
    hash = "sha256-Hu69ymwgsyLZKPZwzmRFU8WqRKWj/tvgXHCnHx9eeVE=";
  };

  build-system = [ hatchling ];

  dependencies = [
    attrs
    httpx
    httpx.optional-dependencies.http2
    hatchling
    parsel
    tqdm
  ];

  meta = {
    description = "Parse anime from RU websites";
    homepage = "https://github.com/vypivshiy/anicli-api";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ azikx ];
  };
}

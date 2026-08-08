{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonApplication (_old: {
  pname = "anicli_api";
  version = "0.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit (_old)
      pname
      version
      ;
    hash = "sha256-/R41ojd+uWgMB1GwpHKPKsJRJqHZWBjmgXEdY2DRdXw=";
  };

  build-system = [
    python312Packages.hatchling
  ];

  dependencies = lib.flatten [
    # keep-sorted start
    python312Packages.attrs
    python312Packages.h2
    python312Packages.hatchling
    python312Packages.httpx
    python312Packages.parsel
    python312Packages.tqdm
    # keep-sorted end
  ];

  meta = {
    description = "Parse anime from RU websites";
    homepage = "https://github.com/vypivshiy/anicli-api";
    license = lib.licenses.mit;
  };
})

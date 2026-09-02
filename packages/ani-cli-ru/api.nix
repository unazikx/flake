{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonApplication (_old: {
  pname = "anicli_api";
  version = "0.12.0";
  pyproject = true;

  src = fetchPypi {
    inherit (_old)
      pname
      version
      ;
    hash = "sha256-vl1NVoFGh68qSN/N7ZIUOq1CKq44xvQyqZX/oJ5r1mo=";
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

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Parse anime from RU websites";
    homepage = "https://github.com/vypivshiy/anicli-api";
    license = lib.licenses.mit;
  };
})

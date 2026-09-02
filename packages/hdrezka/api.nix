{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonPackage (_old: {
  pname = "hdrezkaapi";
  version = "11.2.3";
  pyproject = true;

  src = fetchPypi {
    pname = "hdrezkaapi";
    inherit (_old)
      version
      ;
    hash = "sha256-nPQM/dFVl7xHgQ3SUidSZPE4ch/q8cz/O0kpUFxrlkw=";
  };

  build-system = [
    python312Packages.setuptools
  ];

  dependencies = [
    python312Packages.requests
    python312Packages.beautifulsoup4
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Unofficial Python library for parsing content from HDRezka";
    homepage = "https://github.com/SuperZombi/HdRezkaApi";
    license = lib.licenses.mit;
  };
})

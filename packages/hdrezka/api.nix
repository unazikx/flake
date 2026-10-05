{
  python3Packages,
  fetchPypi,
  lib,
}:

python3Packages.buildPythonPackage (_final: {
  pname = "hdrezkaapi";
  version = "11.2.3";
  pyproject = true;

  src = fetchPypi {
    pname = "hdrezkaapi";
    inherit (_final)
      version
      ;
    hash = "sha256-nPQM/dFVl7xHgQ3SUidSZPE4ch/q8cz/O0kpUFxrlkw=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = [
    python3Packages.requests
    python3Packages.beautifulsoup4
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Unofficial Python library for parsing content from HDRezka";
    homepage = "https://github.com/SuperZombi/HdRezkaApi";
    license = lib.licenses.mit;
  };
})

{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonApplication (_old: {
  pname = "uvicorn";
  version = "0.52.4";
  pyproject = true;

  src = fetchPypi {
    inherit (_old)
      pname
      version
      ;
    hash = "sha256-c6z+5HoLEzxd4T0hlJLWLYox6TX0/m5BojJFGhU3n4Y=";
  };

  build-system = [
    python312Packages.hatchling
  ];

  dependencies = [
    python312Packages.click
    python312Packages.h11
    python312Packages.typing-extensions
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "ASGI web server implementation for Python";
    homepage = "https://github.com/Kludex/uvicorn";
    license = lib.licenses.bsd3ClauseTso;
    mainProgram = "uvicorn";
  };
})

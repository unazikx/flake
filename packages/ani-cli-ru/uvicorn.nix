{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonApplication (_old: {
  pname = "uvicorn";
  version = "0.52.1";
  pyproject = true;

  src = fetchPypi {
    inherit (_old)
      pname
      version
      ;
    hash = "sha256-ES7GYYFBiay8zT97hkYBR8wGX8ksCCGvp4kYeA5DVN0=";
  };

  build-system = [
    python312Packages.hatchling
  ];

  dependencies = [
    python312Packages.click
    python312Packages.h11
    python312Packages.typing-extensions
  ];

  meta = {
    description = "ASGI web server implementation for Python";
    homepage = "https://github.com/Kludex/uvicorn";
    license = lib.licenses.bsd3ClauseTso;
    mainProgram = "uvicorn";
  };
})

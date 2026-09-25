{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonApplication (_final: {
  pname = "uvicorn";
  version = "0.54.0";
  pyproject = true;

  src = fetchPypi {
    inherit (_final)
      pname
      version
      ;
    hash = "sha256-ouM8v6oDBvjmsME+DLidfXoto+YrkMZuGMM9mAeyhiA=";
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

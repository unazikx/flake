{
  pkgs,
  ...
}:

with pkgs.python312Packages;

buildPythonApplication rec {
  pname = "uvicorn";
  version = "0.40.0";
  pyproject = true;

  src = pkgs.fetchPypi {
    inherit
      pname
      version
      ;
    hash = "sha256-g5Z2Z16H5zaUUYtVdP0PJMnZe0a+oW33uMBeoaUQceo=";
  };

  build-system = [ hatchling ];

  dependencies = [
    click
    h11
    typing-extensions
  ];

  meta = {
    description = "ASGI web server implementation for Python";
    homepage = "https://github.com/Kludex/uvicorn";
    license = lib.licenses.bsd3ClauseTso;
    maintainers = with lib.maintainers; [ azikx ];
  };
}

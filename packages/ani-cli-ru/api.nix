{
  python312Packages,
  fetchPypi,
  lib,
}:

python312Packages.buildPythonApplication (_old: {
  pname = "anicli_api";
  version = "0.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit (_old)
      pname
      version
      ;
    hash = "sha256-8EKpLK04SgP3Xn8ZK82+0Dewwen/xYiDEeGozkYdhv8=";
  };

  build-system = [
    python312Packages.hatchling
  ];

  dependencies = lib.flatten [
    # keep-sorted start
    python312Packages.attrs
    python312Packages.hatchling
    python312Packages.httpx
    python312Packages.httpx.optional-dependencies.http2
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

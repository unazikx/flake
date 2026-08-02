{
  python312Packages,
  fetchPypi,
  ani-cli-ru,
  lib,
}:

python312Packages.buildPythonApplication (_old: {
  pname = "anicli_ru";
  version = "6.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (_old)
      pname
      version
      ;
    hash = "sha256-tlF+j508zVOTxTvSS+7BhVS1ZM+ugqpvSwDOpsYkaUs=";
  };

  build-system = [
    python312Packages.hatchling
  ];

  dependencies = [
    # keep-sorted start
    ani-cli-ru.api
    ani-cli-ru.uvicorn
    python312Packages.fastapi
    python312Packages.jinja2
    python312Packages.prompt-toolkit
    python312Packages.python-multipart
    python312Packages.rich
    python312Packages.segno
    python312Packages.typer
    # keep-sorted end
  ];

  meta = {
    description = "Watch anime with ru sources via mpv";
    homepage = "https://github.com/vypivshiy/ani-cli-ru";
    license = lib.licenses.gpl3;
    mainProgram = "anicli-ru";
  };
})

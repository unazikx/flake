{
  pkgs,
  anicli-api ? pkgs.callPackage ./anicli-api.nix { },
  uvicorn ? pkgs.callPackage ./uvicorn.nix { },
  ...
}:

with pkgs.python312Packages;

buildPythonApplication rec {
  pname = "anicli_ru";
  version = "6.0.2";
  pyproject = true;

  src = pkgs.fetchPypi {
    inherit
      pname
      version
      ;
    hash = "sha256-mDkXJGL0YeIYP5wKkMG56Tte284nsUEDkOxRCCn3Snc=";
  };

  build-system = [ hatchling ];

  dependencies = [
    jinja2
    prompt-toolkit
    python-multipart
    rich
    segno
    typer
    fastapi

    anicli-api
    uvicorn
  ];

  meta = {
    description = "Watch anime with ru sources via mpv";
    homepage = "https://github.com/vypivshiy/ani-cli-ru";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ azikx ];
    mainProgram = "anicli-ru";
  };
}

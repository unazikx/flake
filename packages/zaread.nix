{
  writeShellApplication,
  fetchurl,
  libreoffice,
  md2pdf,
  lib,
}:

writeShellApplication {
  name = "zaread";

  runtimeInputs = [
    libreoffice
    md2pdf
  ];

  text = lib.readFile (fetchurl {
    url = "https://raw.githubusercontent.com/paoloap/zaread/035b476f8a64627f047f710bb04cadb3aa696b4d/zaread";
    sha256 = "sha256-naZG3YJSTlqt9t1RzIcDtzga5wnMwkNqnBnmJ7rqxY8=";
  });

  meta = {
    description = "Lightweight MS Office file reader via zathura";
    homepage = "https://github.com/paoloap/zaread";
    license = lib.licenses.gpl3;
    mainProgram = "zaread";
  };
}

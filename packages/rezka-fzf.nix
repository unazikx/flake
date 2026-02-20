{
  pkgs,
  lib,
}:

with pkgs.python312Packages;

buildPythonApplication {
  pname = "rezka-fzf";
  version = "git";

  srcs = [
    (pkgs.fetchurl {
      name = "rezka-fzf";
      url = "https://gist.githubusercontent.com/axax-loll/09750e07b880123ccbe9010343f066ee/raw/c6cef2cd4b93af23cf6d6a7fb19a65f902145d44/rezka_fzf.py";
      sha256 = "sha256-qp2ndBm7D/ZwhEcmlzFb7MD8HmCPd2aCgKp5XMXoGu0=";
    })

    (pkgs.fetchurl {
      name = "rezka-rich";
      url = "https://gist.githubusercontent.com/axax-loll/09750e07b880123ccbe9010343f066ee/raw/c6cef2cd4b93af23cf6d6a7fb19a65f902145d44/rezka_rich.py";
      sha256 = "sha256-0wz1LmO3NWoyb58cUmYDVXAt0yvJ1baQ5FdbF2J7OW0=";
    })
  ];

  dontUnpack = true;

  propagatedBuildInputs = [
    pkgs.mpv
    pkgs.fzf
    pkgs.python3
    requests
    rich

    (buildPythonPackage rec {
      pname = "HdRezkaApi";
      version = "11.1.0";
      pyproject = true;

      src = pkgs.fetchPypi {
        pname = "HdRezkaApi";
        inherit version;
        hash = "sha256-ks8C+kBVI99c8CGyCMGv11ZvslKoSrBkcUXoZnNLnHU=";
      };

      dependencies = [
        requests
        beautifulsoup4
      ];

      build-system = [
        setuptools
      ];
    })
  ];

  format = "other";

  installPhase = ''
    for src in $srcs; do
      filename=$(basename $src)
      filename_no_hash=$(echo $filename | awk -F'-' '{print $(NF-1) "-" $NF}')
      install -Dm755 $src $out/bin/$filename_no_hash
    done
  '';

  meta = {
    description = "Watch movies/series from rezka in terminal";
    homepage = "https://gist.github.com/axax-loll/09750e07b880123ccbe9010343f066ee";
    license = lib.licenses.wtfpl;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ unazikx ];
    mainProgram = "rezka-fzf";
  };
}

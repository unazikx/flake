{
  appimageTools,
  fetchurl,
  ...
}:

appimageTools.wrapAppImage (_final: {
  pname = "Hypersomnia"; # for .desktop compat
  version = "3.0.0";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://hypersomnia.io/builds/3.0.0/Hypersomnia.AppImage";
      sha256 = "sha256-uyLBrgdHiVnL6SBviQVma0NqOoRem0KShiKeQPsf5+Q=";
    };
  };

  extraInstallCommands =
    # bash
    ''
      install -Dm444 ${_final.src}/Hypersomnia.desktop -t $out/share/applications
      cp -r ${_final.src}/usr/share/icons $out/share
    '';
})

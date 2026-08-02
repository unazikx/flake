{
  stdenv,
  fetchzip,
  lib,
}:

stdenv.mkDerivation (_old: {
  pname = "terra-firma-greg";
  version = "0.12.10";

  src = fetchzip {
    url = "https://github.com/TerraFirmaGreg-Team/Modpack-Modern/releases/download/${_old.version}/TerraFirmaGreg-Modern-${_old.version}-serverpack.zip";
    sha256 = "sha256-DFRRhKXqLpEnHzbPBS4012zb5ta17HBYi/6UWD7r51o=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir $out

    # dont need ya
    rm -r forge-auto-install.txt \
      minecraft_server.jar \
      server.properties \
      server_starter.conf \
      start_server.bat \
      start_server.sh

    cp -r * $out
  '';

  meta = {
    description = "Minecraft modpack TerraFirmaGreg (TerraFirmaCraft + GregTech + Create)";
    homepage = "https://github.com/TerraFirmaGreg-Team/Modpack-Modern";
    license = lib.licenses.lgpl3Only;
  };
})

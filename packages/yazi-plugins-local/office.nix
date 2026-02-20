{
  pkgs,
  lib,
}:

pkgs.yaziPlugins.mkYaziPlugin {
  pname = "office.yazi";
  version = "git";

  src = pkgs.fetchFromGitHub {
    owner = "macydnah";
    repo = "office.yazi";
    rev = "4002d368c09841d5722d55720fd29c2eba05300f";
    hash = "sha256-XE+EfVPsO09zG8qYEhN6O95mS9NJlTdOd4Gsem2KtPI=";
  };

  meta = {
    description = "Documents previewer plugin, using libreoffice";
    homepage = "https://github.com/macydnah/office.yazi";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ azikx ];
  };
}

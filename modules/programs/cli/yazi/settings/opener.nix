{
  lib,
  config,
  ...
}:

with lib;

{
  edit = [
    {
      run = "${config.hm.home.sessionVariables.EDITOR} %s";
      desc = "Open in editor";
      block = true;
    }
  ];

  play = [
    {
      run = "mpv --fs %h";
      desc = "Open video in MPV";
    }
  ];

  image = [
    {
      run = "swayimg %s";
      desc = "Open image in swayimg";
    }
  ];

  torrent = [
    {
      run = "qbt torrent add file %s";
      desc = "Add torrent to qBittorrent";
      orphan = true;
    }
  ];

  office = [
    {
      run = "libreoffice %h";
      desc = "Open document in Libreoffice";
      orphan = true;
    }
  ];

  officePdf = [
    {
      run = "zaread %h";
      desc = "Open document in Zathura";
      orphan = true;
    }
  ];

  pdf = [
    {
      run = "zathura %h";
      desc = "Open pdf in Zathura";
    }
  ];

  extract = [
    {
      run = "ouch d -y %s";
      desc = "Extract files via ouch";
    }
  ];

  kdbx = [
    {
      run = "keepassxc %h";
      desc = "Open keepass password db";
    }
  ];

  prism = [
    {
      run = "prismlauncher %s";
      desc = "Import modpack to Prismlauncher";
    }
  ];

  exe = [
    {
      run = "umu-run %h";
      desc = "Open windows exe via umu-run";
      block = true;
    }
  ];

  native = mkIf config.programs.steam.enable [
    {
      run = "steam-run %h";
      desc = "Open native bin via steam-run";
      orphan = true;
      block = true;
    }
  ];

  open = [
    {
      run = "xdg-open %h";
      desc = "Open via xdg-open";
    }
  ];
}

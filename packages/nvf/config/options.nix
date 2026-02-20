{
  vim = {
    viAlias = true;
    vimAlias = true;

    withNodeJs = false;
    withPython3 = false;
    withRuby = false;

    enableLuaLoader = true;
    clipboard = {
      enable = true;
      registers = "unnamed";
      providers.wl-copy.enable = true;
    };

    lineNumberMode = "relNumber";

    options = {
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      mouse = toString null;
      laststatus = 0;
    };
  };
}

{
  ...
}:

{
  config.vim = {
    enableLuaLoader = true;

    options = {
      mouse = toString null;

      number = true;
      relativenumber = true;

      autoindent = true;
      smartindent = true;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;

      list = true;
      listchars = "tab:» ,trail:·,nbsp:␣";

      wrap = true;
      linebreak = true;

      ignorecase = true;
      smartcase = true;

      showmode = false;
      undofile = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " m";
    };
  };
}

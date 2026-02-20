{
  pkgs,
  ...
}:

let
  plugin = n: t: {
    "${n}" = (pkgs.writeTextDir "${n}.yazi/main.lua" t) + "/${n}.yazi";
  };
in

{
  plugins = {
    inherit (pkgs.yaziPlugins)
      chmod
      full-border
      git
      jump-to-char
      mount
      ouch
      restore
      smart-enter
      smart-paste
      toggle-pane
      yatline
      ;

    inherit (pkgs.own.yazi-plugins)
      clipboard-to-file
      glow
      office
      wl-clipboard
      ;
  }

  # custom
  // (plugin "parent-arrow" # lua
    ''
      --- @sync entry
      local function entry(_, job)
      local parent = cx.active.parent if not parent then return end
      local offset = tonumber(job.args[1]) if not offset then return
      ya.err(job.args[1], 'is not a number') end
      local start = parent.cursor + 1 + offset
      local end_ = offset < 0 and 1 or #parent.files
      local step = offset < 0 and -1 or 1
      for i = start, end_, step do local target = parent.files[i]
      if target and target.cha.is_dir then return
      ya.mgr_emit("cd", { target.url }) end end end
      return { entry = entry }
    ''
  )

  // (plugin "smart-tab" # lua
    ''
      --- @sync entry
      return { entry = function() local h = cx.active.current.hovered
      ya.manager_emit("tab_create", h and h.cha.is_dir and
      { h.url } or { current = true }) end, }
    ''
  );
}

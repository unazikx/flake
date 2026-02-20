{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;
let
  rounding = (toString 14) + "px";
in

# css
''
  * {
    font-family: "${config.stylix.fonts.monospace.name}";
    font-weight: bold;
    font-size: ${toString (config.stylix.fonts.sizes.applications + 4)}px;
  }

  window#waybar {
    background-color: ${base00};
    color: ${base05};
  }

  window#waybar > box {
    margin: 5px 0px 0px 0px;
    background-color: ${base00};
    border-right: 3px solid ${base01};
  }

  /* workspaces */
  #workspaces button {
    background-color: ${base02};
    border-radius: ${rounding};
    margin: 4px;
    padding: 2px;
    color: ${base05};
    min-height: 25px;
    transition: all 0.4s ease-in-out;
  }

  #workspaces button label {
    color: ${base05};
    font-weight: bolder;
  }

  #workspaces button.empty {
    background: ${base01};
  }

  #workspaces button.active {
    background: radial-gradient(circle,
      ${base0C} 0%,
      ${base0E} 50%,
      ${base0D} 100%
    );
    background-size: 400% 400%;
    animation: gradient 5s linear infinite;
    transition: all 0.3s ease-in-out;
    border-color: ${base00};
  }

  #workspaces button.active label {
    color: ${base02};
    font-weight: bolder;
  }

  @keyframes gradient {
    0% { background-position: 0px 50px; }
    50% { background-position: 100px 30px; }
    100% { background-position: 0px 50px; }
  }

  /* modules */
  #backlight,
  #battery,
  #clock,
  #custom-date,
  #custom-launcher,
  #custom-power,
  #custom-separator
  #language,
  #pulseaudio,
  #text,
  #window,
  #workspaces

  #backlight,
  #bluetooth,
  #battery,
  #cava,
  #clock,
  #custom-date,
  #custom-launcher,
  #custom-power,
  #custom-separator,
  #disk,
  #language,
  #network,
  #pulseaudio,
  #tray {
    color: ${base05};
    background-color: ${base00};
    padding: 0 0.4em;
    padding-top: 0px;
    padding-bottom: 2px;
    border-style: solid;
    min-height: 30px;
  }

  #workspaces {
    margin: 3 0 3 0px;
    border-radius: 14 14 14 14px;
  }
''

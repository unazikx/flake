{
  ...
}:

{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      devshells.motion-canvas = {
        name = "Common Canvas";

        packages = [
          pkgs.nodejs
          pkgs.ffmpeg
        ];

        commands = [
          {
            name = "common-canvas kickstart";
            command = "npm init @canvas-commons@latest";
            help = "Create project";
          }
          {
            name = "common-canvas init";
            command = "npm install";
            help = "Install dependencies";
          }
          {
            name = "common-canvas start-editor";
            command = "npm start";
            help = "Start editor (http://localhost:9000)";
          }
        ];

        devshell.motd = ''
          󱖲 {45}Welcome to Motion Canvas.{reset}
            (https://canvascommons.io/docs)
          Enter 'menu' for general commands.
        '';
      };
    };
}

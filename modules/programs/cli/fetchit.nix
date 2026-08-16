{
  zen,
  ...
}:

{
  zen.programs.cli.fetchit = {
    description = ''
      customizable fetcher
      idk very strange
    '';

    includes = [
      zen.custom.fetchit
    ];

    homeManager =
      {
        self',
        pkgs,
        ...
      }:
      {
        programs.fetchit = {
          enable = true;

          package = self'.packages.fetchit;

          settings =
            # lua
            ''
              art = {
                source = "${pkgs.writeText "fetchit-logo.txt" ''
                               ___   __             
                       /#\     \QQ\ /fy;            
                       \#+\     \lQvfy/             
                    ,=#####=##+\ \QOy/   /,         
                   /+=#######=++\ \Qq\  /+#;        
                        ,——,       \O/ /+#/_        
                  _____/fy/         ‘ /+###+\       
                  \QOOQfy/           /##/¯¯¯¯       
                   ¯¯/fy/ ,         /y#/            
                    ,fy/ /+\  _____________        
                     \Y  \##\ \QQqQeeOoQQQy\       
                         /#|#\ ‾‾‾‾‾\EQ\‾‾‾‾       
                        ,+#,\#\      \QQ\          
                        \#/ \##\      \Q/          
                         ‾   ‾‾‾
                ''}"
              }

              column_padding = 2

              function fetch()
                return {
                  columns = {
                    art.out,
                    {
                      color.red(user.name .. "@" .. host.name),
                      color.red("os:      ") .. string.lower(os.name),
                      color.yellow("kernel:  ") .. "linux " .. kernel.release,
                      color.green("cpu:     ") .. string.lower(cpu.name),
                      color.blue("gpu:     ") .. string.lower(gpu.name),
                      color.magenta("ram:     ") .. string.format("%.1fGB/%.1fGB (%.1f%%)", memory.used_gb, memory.total_gb, memory.percent),
                    }
                }
              }
              end
            '';
        };
      };
  };
}

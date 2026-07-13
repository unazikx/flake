{
  ...
}:

{
  zen.programs.cli.lowfi = {
    description = ''
      web radio for lofi girl and links
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.lowfi = {
          enable = true;

          trackLists = {
            synthboy = {
              url = "https://lofigirl.com/wp-content/uploads/";
              tracks = [
                "2024/01/1.-i_m-alone-out-here-ft.-Outgrown-master.mp3"
                "2024/01/2.-aurora-ft.-Outgrown-master.mp3"
                "2024/01/3.-dusk-master.mp3"
                "2024/01/4.-aria-ft.-after-noon-master.mp3"
                "2024/01/5.-dreamscape-ft.-Luke-Tidbury-master.mp3"
                "2023/11/Le-Metroid-Crystal-Children.mp3"
                "2023/11/Le-Metroid-Frequencies.mp3"
                "2023/11/Le-Metroid-Space-Echoes.mp3"
                "2023/11/Le-Metroid-Voyager.mp3"
                "2023/11/Le-Metroid-Orion.mp3"
                "2023/11/Le-Metroid-Sleepwalker.mp3"
                "2023/11/Le-Metroid-Blackhole.mp3"
                "2023/09/01-Akraa-Lightyears-Kupla-master.mp3"
                "2023/09/05-VIQ-x-Krosia-Echodrift-Kupla-Master.mp3"
                "2023/09/10-Protocols-Orion-Kupla-Master.mp3"
                "2023/06/Foudroie-Journey-2023.mp3"
                "2023/06/Foudroie-Odyssey-MASTER.mp3"
                "2023/05/Polaris.mp3"
                "2023/05/Aurora.mp3"
                "2023/05/City-Lights.mp3"
              ];
            };
          };
        };
      };
  };
}

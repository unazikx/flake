{
  ...
}:

{
  zen.games.minecraft = {
    meta = {
      defaultJRE = pkgs: pkgs.temurin-jre-bin-25;

      temurinJRE = pkgs: [
        # its all LTS
        # https://adoptium.net/temurin/releases
        #
        # keep-sorted start
        pkgs.temurin-jre-bin-17
        pkgs.temurin-jre-bin-21
        pkgs.temurin-jre-bin-25
        pkgs.temurin-jre-bin-8
        # keep-sorted end
      ];
    };
  };
}

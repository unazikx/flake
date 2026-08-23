{
  ...
}:

{
  zen.games.minecraft = {
    wiki = {
      "Minecraft Modpacks" = {
        links = [
          {
            name = "eternal-fire-studio";
            url = "https://boosty.to/rein1_modpacks";
            logo = "https://images.boosty.to/user/25844628/avatar";
          }
          {
            name = "vortex";
            url = "https://vrtx.su";
            logo = "https://vrtx.su/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo.2skjwur5alw0-.png&w=64&q=75";
          }
          {
            name = "terra-firma-greg";
            url = "https://terrafirmagreg.team";
            logo = "https://terrafirmagreg.team/storage/img/64x-256p-tfg-logo-v4.gif";
          }
          {
            name = "homestead";
            url = "https://modrinth.com/modpack/homestead";
            logo = "https://cdn.modrinth.com/data/6HvKwSky/d100be12ed4f630466412f805e068da29b6e4898_96.webp";
          }
          {
            name = "cabin";
            url = "https://www.curseforge.com/minecraft/modpacks/cabin";
            logo = "https://media.forgecdn.net/avatars/thumbnails/899/846/256/256/638346046780138525.png";
          }
        ];
      };
    };

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

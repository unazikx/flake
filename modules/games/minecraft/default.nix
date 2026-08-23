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
            logo = "https://media.forgecdn.net/avatars/thumbnails/899/846/256/256/638346046780138525.png";
          }
          {
            name = "vortex";
            url = "https://vrtx.su";
            logo = "https://media.forgecdn.net/avatars/thumbnails/899/846/256/256/638346046780138525.png";
          }
          {
            name = "terra-firma-greg";
            url = "https://terrafirmagreg.team";
            logo = "https://media.forgecdn.net/avatars/thumbnails/899/846/256/256/638346046780138525.png";
          }
          {
            name = "homestead";
            url = "https://modrinth.com/modpack/homestead";
            logo = "https://media.forgecdn.net/avatars/thumbnails/899/846/256/256/638346046780138525.png";
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

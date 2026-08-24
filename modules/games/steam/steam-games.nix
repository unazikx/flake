{
  ...
}:

{
  zen.games.steam.steam-games = {
    description = ''
      list of variables for proton
      dwproton: https://dawn.wine/dawn-winery/dwproton#runtime-config-options
      proton-ge: https://github.com/gloriouseggroll/proton-ge-custom#options
    '';

    homeManagerNixos =
      {
        pkgs,
        lib,
        config,
        osConfig,
        ...
      }:
      let
        steamapps = "${config.xdg.dataHome}/Steam/steamapps";
        cfg = config.programs.steam.config;
      in
      {
        programs.steam.config = {
          apps = lib.mkMerge [
            # default launch options
            (lib.mkGames
              {
                desktopEntry.enable = true;
                compatTool = lib.mkDefault cfg.defaultCompatTool;
                allowDownloadsWhileRunning = lib.mkDefault "always";

                systemd.enable = true;

                wrappers = [
                  (
                    let
                      mangohud = config.programs.mangohud;
                    in
                    lib.mkIf mangohud.enable (lib.getExe mangohud.package)
                  )
                  (
                    let
                      gamemode = osConfig.programs.gamemode;
                    in
                    lib.mkIf gamemode.enable (lib.getExe gamemode.package)
                  )
                ];

                env = {
                  DXVK_ASYNC = 1;
                  PROTON_ENABLE_WAYLAND = 1;
                  PROTON_USE_NTSYNC = 1;
                };
              }
              {
                # keep-sorted start block=yes newline_separated=yes
                "427410" = {
                  name = "Abiotic Factor";
                };

                "2629230" = {
                  name = "Adventures Of Sir Kicksalot";
                };

                "1390190" = {
                  name = "Apico";
                };

                "325210" = {
                  name = "Arctico";
                };

                "2379780" = {
                  name = "Balatro";
                  language = "russian";
                };

                "1086940" = {
                  name = "Baldurs Gate 3";
                  language = "russian";
                };

                "371970" = {
                  name = "Barony";
                  betaBranch = "translation-fix";
                };

                "35140" = {
                  name = "Batman: Arkham Asylum";
                };

                "200260" = {
                  name = "Batman: Arkham City";
                };

                "208650" = {
                  name = "Batman: Arkham Knight";
                };

                "1244950" = {
                  name = "Battletoads";
                  language = "russian";
                };

                "219760" = {
                  name = "Beyond Divinity";
                  language = "russian";
                };

                "1665260" = {
                  name = "Beyond Sunset";
                  wrappers = lib.mkAfter [
                    (lib.getExe pkgs.gzdoom)
                    "-iwad"
                  ];
                };

                "738520" = {
                  name = "Breathedge";
                  language = "russian";
                };

                "501590" = {
                  name = "Bulletstorm";
                  language = "russian";
                };

                "1238080" = {
                  name = "Burnout Paradise: Remastered";
                  compatTool = "GE-Proton";
                  language = "russian";
                  args = [ "-skipvideos" ];
                };

                "505170" = {
                  name = "Carmageddon Max Damage";
                  language = "russian";
                };

                "2904040" = {
                  name = "Cheap Car Repair";
                };

                "3214610" = {
                  name = "Cinderia";
                };

                "2442460" = {
                  name = "Citizen Sleeper 2";
                };

                "1578650" = {
                  name = "Citizen Sleeper";
                };

                "493490" = {
                  name = "City Car Driving";
                  compatTool = "proton_8";
                };

                "1591520" = {
                  name = "Clownfield";
                };

                "1663220" = {
                  name = "Coffee Talk 2";
                };

                "3161220" = {
                  name = "Coffee Talk Tokyo";
                };

                "914800" = {
                  name = "Coffee Talk";
                };

                "100" = {
                  name = "Counter Strike: Condition Zero - Deleted Scenes";
                };

                "80" = {
                  name = "Counter Strike: Condition Zero";
                };

                "1996010" = {
                  name = "Crow Country";
                };

                "268910" = {
                  name = "Cuphead";
                };

                "710920" = {
                  name = "Darksiders Genesis";
                };

                "388410" = {
                  name = "Darksiders II Deathinitive Edition";
                  language = "russian";
                };

                "606280" = {
                  name = "Darksiders III";
                  language = "russian";
                };

                "462780" = {
                  name = "Darksiders Warmastered Edition";
                  language = "russian";
                };

                "50620" = {
                  name = "Darksiders";
                  language = "russian";
                };

                "588650" = {
                  name = "Dead Cells";
                  language = "russian";
                };

                "6910" = {
                  name = "Deus Ex: GOTY";
                };

                "238010" = {
                  name = "Deus Ex: Human Revolution";
                  language = "russian";
                };

                "6920" = {
                  name = "Deus Ex: Invisible War";
                };

                "337000" = {
                  name = "Deus Ex: Mankid Divided";
                  language = "russian";
                };

                "258180" = {
                  name = "Deus Ex: The Fall";
                  language = "russian";
                };

                "632470" = {
                  name = "Disco Elysium";
                  language = "russian";
                };

                "214170" = {
                  name = "Divine Divinity";
                  language = "russian";
                };

                "219780" = {
                  name = "Divinity: 2 - Developer's Cut";
                  language = "russian";
                };

                "435150" = {
                  name = "Divinity: Original Sin 2";
                  language = "russian";
                };

                "373420" = {
                  name = "Divinity: Original Sin";
                  language = "russian";
                };

                "2285550" = {
                  name = "Doloc Town";
                };

                "322330" = {
                  name = "Dont Starve Together";
                };

                "312530" = {
                  # https://www.protondb.com/app/312530#VBbR6m5Ilw
                  name = "Duck Game";
                  compatTool = "proton_8";
                };

                "519860" = {
                  name = "Dusk";
                  language = "russian";
                };

                "239140" = {
                  name = "Dying Light";
                  language = "russian";
                };

                "3293010" = {
                  name = "Easy Delivery Co";
                };

                "359320" = {
                  name = "Elite Dangerous";
                  language = "russian";
                };

                "1969810" = {
                  name = "Enter The Chronosphere";
                };

                "311690" = {
                  name = "Enter The Gungeon";
                  language = "russian";
                };

                "4986460" = {
                  name = "EthrA (playtest)";
                };

                "1209490" = {
                  name = "Exit The Gungeon";
                };

                "1986840" = {
                  name = "FNAF Popgoes";
                };

                "427520" = {
                  name = "Factorio";
                  language = "russian";
                };

                "821250" = {
                  name = "Flotsam";
                };

                "3509230" = {
                  name = "Gambonanza";
                };

                "4000" = {
                  name = "Garrys Mod";
                  betaBranch = "x86-64";
                };

                "1150760" = {
                  name = "Gloomwood";
                };

                "1762930" = {
                  name = "Goat Simulator Remastered";
                };

                "599140" = {
                  name = "Graveyard Keeper";
                };

                "858710" = {
                  name = "Gravity Circuit";
                };

                "1145360" = {
                  name = "Hades";
                };

                "1433340" = {
                  name = "Happy Humble Burger Farm";
                };

                "4487840" = {
                  name = "Hard Truck 2";
                  language = "russian";
                };

                "203140" = {
                  name = "Hitman: Absolution";
                  language = "russian";
                };

                "6860" = {
                  name = "Hitman: Blood Money";
                };

                "367520" = {
                  name = "Hollow Knight";
                };

                "1030300" = {
                  name = "Hollow Knight: Silksong";
                };

                "824600" = {
                  name = "Hrot";
                };

                "257850" = {
                  name = "Hyper Light Drifter";
                };

                "2608270" = {
                  name = "Intravenous 2";
                };

                "1486630" = {
                  name = "Intravenous";
                };

                "562860" = {
                  name = "Ion Fury";
                };

                "3771740" = {
                  name = "Iq Under Construction";
                };

                "446020" = {
                  name = "Jalopy";
                };

                "1903620" = {
                  name = "Killer Frequency";
                  language = "russian";
                };

                "758870" = {
                  name = "Kynseed";
                };

                "313690" = {
                  name = "LEGO: Batman Beyond Gotham";
                };

                "1898290" = {
                  name = "LEGO: Bricktales";
                  language = "russian";
                };

                "1544360" = {
                  name = "LEGO: Builders Journey";
                };

                "578330" = {
                  name = "LEGO: City Undercover";
                  language = "russian";
                };

                "829110" = {
                  name = "LEGO: DC Super Villains";
                  language = "russian";
                };

                "647830" = {
                  name = "LEGO: Marvel Super Heroes 2";
                  language = "russian";
                };

                "249130" = {
                  name = "LEGO: Marvel Super Heroes";
                  language = "russian";
                };

                "920210" = {
                  name = "LEGO: Star Wars The Skywalker Saga";
                  language = "russian";
                };

                "332310" = {
                  name = "LEGO: Worlds";
                  language = "russian";
                };

                "3495730" = {
                  name = "Lucid Blocks";
                };

                "629820" = {
                  name = "Maneater";
                  language = "russian";
                };

                "2355150" = {
                  name = "Midbourne";
                };

                "3363200" = {
                  name = "Midnight Snack";
                };

                "1127400" = {
                  name = "Mindustry";
                };

                "1672970" = {
                  name = "Minecraft Dungeons";
                };

                "1928870" = {
                  name = "Minecraft Legends";
                };

                "606150" = {
                  name = "Moonlighter";
                  compatTool = null;
                  language = "russian";
                };

                "516750" = {
                  name = "My Summer Car";
                };

                "4164420" = {
                  name = "My Winter Car";
                };

                "4508340" = {
                  name = "NTE: Neverness to Everness";
                };

                "1169040" = {
                  name = "Necesse";
                  language = "russian";
                };

                "1262540" = {
                  name = "Need For Speed";
                  language = "russian";
                };

                "1222680" = {
                  name = "Need For Speed: Heat";
                  language = "russian";
                };

                "1038300" = {
                  name = "New Super Lucky's Tale";
                };

                "2873080" = {
                  name = "Noexistence You Me";
                };

                "881100" = {
                  name = "Noita";
                };

                "155710" = {
                  name = "One Million Fatal Guns";
                };

                "387290" = {
                  name = "Ori and the Blind Forest - Definitive Edition";
                  language = "russian";
                };

                "261570" = {
                  name = "Ori and the Blind Forest";
                  language = "russian";
                };

                "1057090" = {
                  name = "Ori and the Will of the Wisps";
                };

                "728880" = {
                  name = "Overcooked 2";
                  language = "russian";
                };

                "448510" = {
                  name = "Overcooked";
                };

                "1118520" = {
                  name = "Paralives";
                };

                "3808690" = {
                  name = "Pathogenic";
                  compatTool = null;
                };

                "490640" = {
                  name = "Plastic Warfare";
                };

                "1640300" = {
                  name = "Project Warlock 2";
                };

                "108600" = {
                  name = "Project Zomboid";
                };

                "2310" = {
                  name = "Quake";
                  language = "russian";
                };

                "3214660" = {
                  name = "REPO";
                };

                "248820" = {
                  name = "Risk of Rain (2013)";
                };

                "1337520" = {
                  name = "Risk of Rain: Returns";
                  language = "russian";
                };

                "590830" = {
                  name = "S&box";
                };

                "2124120" = {
                  name = "SULFUR";
                };

                "2533960" = {
                  name = "SUMMERHOUSE";
                };

                "978300" = {
                  name = "Saints Row: The Third Remastered";
                  language = "russian";
                };

                "2764460" = {
                  name = "Sandustry";
                };

                "526870" = {
                  name = "Satisfactory";
                };

                "775500" = {
                  name = "Scarlet Nexus";
                  language = "russian";
                };

                "1592280" = {
                  name = "Selaco";
                };

                "2436940" = {
                  name = "Sephiria";
                };

                "640340" = {
                  name = "Serious Sam Tormental";
                };

                "2162800" = {
                  name = "Shapez 2 - factory";
                };

                "1318690" = {
                  name = "Shapez";
                };

                "307690" = {
                  name = "Sleeping Dogs";
                  language = "russian";
                };

                "1902940" = {
                  name = "Snacktorio";
                };

                "979110" = {
                  name = "Space Haven";
                };

                "211820" = {
                  name = "Starbound";
                };

                "2085540" = {
                  name = "Stick It to the Stickman";
                  language = "russian";
                };

                "3417410" = {
                  name = "Storebound";
                };

                "512900" = {
                  name = "Streets Of Rouge";
                  language = "russian";
                };

                "962580" = {
                  name = "Summer In Mara";
                };

                "847370" = {
                  name = "Sunset Overdrive";
                  language = "russian";
                };

                "847360" = {
                  name = "Super Lucky's Tale";
                };

                "321400" = {
                  name = "Supraball";
                };

                "1522870" = {
                  name = "Supraland Six Inches Under";
                };

                "813630" = {
                  name = "Supraland";
                };

                "508440" = {
                  name = "TABS";
                };

                "828740" = {
                  name = "Tales of the Neon Sea";
                };

                "105600" = {
                  name = "Terraria";
                };

                "250900" = {
                  name = "The Binding Of Isaac: Rebirth";
                };

                "22320" = {
                  name = "The Elder Scrolls III: Morrowind";
                };

                "22330" = {
                  name = "The Elder Scrolls IV: Oblivion";
                };

                "489830" = {
                  name = "The Elder Scrolls V: Skyrim";
                  language = "russian";
                };

                "641990" = {
                  name = "The Escapists 2";
                  language = "russian";
                };

                "298630" = {
                  name = "The Escapists";
                  language = "russian";
                };

                "305620" = {
                  name = "The Long Dark";
                };

                "897450" = {
                  name = "The Survivalists";
                  language = "russian";
                };

                "292030" = {
                  name = "The Witcher 3";
                  language = "russian";
                };

                "1084020" = {
                  name = "Theotown";
                };

                "2617700" = {
                  name = "Tinkerlands";
                  files = {
                    prefix.patch = {
                      "drive_c/users/steamuser/AppData/Local/Tinkerlands/useroptions.conf" = {
                        format = "json";
                        content = {
                          language = 9.0; # russian
                        };
                      };
                    };
                  };
                };

                "200710" = {
                  name = "Torchlight II";
                };

                "41500" = {
                  name = "Torchlight";
                };

                "837470" = {
                  name = "Untitled Goose Game";
                };

                "892970" = {
                  name = "Valheim";
                };

                "2005010" = {
                  name = "Warhammer 40.000: Boltgun";
                };

                "243470" = {
                  name = "Watch Dogs";
                  language = "russian";
                };

                "1390350" = {
                  name = "Webbed";
                  language = "russian";
                };

                "22600" = {
                  name = "Worms: Reloaded";
                  language = "russian";
                };

                "70600" = {
                  name = "Worms: Ultimate Mayhem";
                };

                "327030" = {
                  name = "Worms: WMD";
                  language = "russian";
                };

                "1000410" = {
                  name = "Wrath: Aeon of Ruin";
                };

                "2212330" = {
                  name = "Your Only Move is Hustle";
                };
                # keep-sorted end
              }
            )

            # games for inified prefix
            (lib.mkGames {
              env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
            } { })
          ];
        };
      };
  };
}

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
        ...
      }:
      let
        steamapps = "${config.xdg.dataHome}/Steam/steamapps";
        cfg = config.programs.steam.config;
      in
      {
        programs.steam.config = {
          apps = lib.mkMerge [
            (lib.mkGames
              {
                desktopEntry.enable = true;
                updateBehavior = "always";
                launchOptions = {
                  env = {
                    STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
                    PROTON_ENABLE_WAYLAND = 1;
                  };
                  wrappers = [ (lib.getExe pkgs.gamemode) ];
                };
              }
              {
                # keep-sorted start block=yes newline_separated=yes
                "Burnout Paradise: Remastered" = {
                  compatTool = "GE-Proton";
                  launchOptions = {
                    env = lib.mkForce { };
                    wrappers = lib.mkForce [ ];
                    args = [ "-skipvideos" ];
                  };
                  id = 1238080;
                  language = "russian";
                };

                "City Car Driving" = {
                  compatTool = "proton_8";
                  id = 493490;
                };

                "Duck Game" = {
                  # https://www.protondb.com/app/312530#VBbR6m5Ilw
                  compatTool = "proton_8";
                  id = 312530;
                };
                # keep-sorted end
              }
            )

            # default proton tool
            (lib.mkGames
              {
                desktopEntry.enable = true;
                updateBehavior = "always";
                compatTool = cfg.defaultCompatTool;
                launchOptions = {
                  env = {
                    STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
                    PROTON_USE_NTSYNC = 1;
                    PROTON_ENABLE_WAYLAND = 1;
                  };
                  wrappers = [ (lib.getExe pkgs.gamemode) ];
                };
              }
              {
                # keep-sorted start block=yes newline_separated=yes
                "Abiotic Factor" = {
                  id = 427410;
                };

                "Adventures Of Sir Kicksalot" = {
                  id = 2629230;
                };

                "Apico" = {
                  id = 1390190;
                };

                "Arctico" = {
                  id = 325210;
                };

                "Baldurs Gate 3" = {
                  id = 1086940;
                  language = "russian";
                };

                "Barony" = {
                  id = 371970;
                  betaBranch = "translation-fix";
                };

                "Batman: Arkham Asylum" = {
                  id = 35140;
                };

                "Batman: Arkham City" = {
                  id = 200260;
                };

                "Batman: Arkham Knight" = {
                  id = 208650;
                };

                "Battletoads" = {
                  id = 1244950;
                  language = "russian";
                };

                "Beyond Divinity" = {
                  id = 219760;
                  language = "russian";
                };

                "Breathedge" = {
                  id = 738520;
                  language = "russian";
                };

                "Bulletstorm" = {
                  id = 501590;
                  language = "russian";
                };

                "Carmageddon Max Damage" = {
                  id = 505170;
                  language = "russian";
                };

                "Cheap Car Repair" = {
                  id = 2904040;
                };

                "Cinderia" = {
                  id = 3214610;
                };

                "Citizen Sleeper 2" = {
                  id = 2442460;
                };

                "Citizen Sleeper" = {
                  id = 1578650;
                };

                "Clownfield" = {
                  id = 1591520;
                };

                "Coffee Talk 2" = {
                  id = 1663220;
                };

                "Coffee Talk Tokyo" = {
                  id = 3161220;
                };

                "Coffee Talk" = {
                  id = 914800;
                };

                "Counter Strike: Condition Zero - Deleted Scenes" = {
                  id = 100;
                };

                "Counter Strike: Condition Zero" = {
                  id = 80;
                };

                "Crow Country" = {
                  id = 1996010;
                };

                "Cuphead" = {
                  id = 268910;
                };

                "Darksiders Genesis" = {
                  id = 710920;
                };

                "Darksiders II Deathinitive Edition" = {
                  id = 388410;
                  language = "russian";
                };

                "Darksiders III" = {
                  id = 606280;
                  language = "russian";
                };

                "Darksiders Warmastered Edition" = {
                  id = 462780;
                  language = "russian";
                };

                "Darksiders" = {
                  id = 50620;
                  language = "russian";
                };

                "Dead Cells" = {
                  id = 588650;
                  language = "russian";
                };

                "Deus Ex: GOTY" = {
                  id = 6910;
                };

                "Deus Ex: Human Revolution" = {
                  id = 238010;
                  language = "russian";
                };

                "Deus Ex: Invisible War" = {
                  id = 6920;
                };

                "Deus Ex: Mankid Divided" = {
                  id = 337000;
                  language = "russian";
                };

                "Deus Ex: The Fall" = {
                  id = 258180;
                  language = "russian";
                };

                "Disco Elysium" = {
                  id = 632470;
                  language = "russian";
                };

                "Divine Divinity" = {
                  id = 214170;
                  language = "russian";
                };

                "Divinity: 2 - Developer's Cut" = {
                  id = 219780;
                  language = "russian";
                };

                "Divinity: Original Sin 2" = {
                  id = 435150;
                  language = "russian";
                };

                "Divinity: Original Sin" = {
                  id = 373420;
                  language = "russian";
                };

                "Dont Starve Together" = {
                  id = 322330;
                };

                "Dusk" = {
                  id = 519860;
                  language = "russian";
                };

                "Easy Delivery Co" = {
                  id = 3293010;
                };

                "Elite Dangerous" = {
                  id = 359320;
                  language = "russian";
                };

                "Enter The Gungeon" = {
                  id = 311690;
                  language = "russian";
                };

                "Exit The Gungeon" = {
                  id = 1209490;
                };

                "FNAF Popgoes" = {
                  id = 1986840;
                };

                "Factorio" = {
                  id = 427520;
                  language = "russian";
                };

                "Flotsam" = {
                  id = 821250;
                };

                "Gambonanza" = {
                  id = 3509230;
                };

                "Garrys Mod" = {
                  id = 4000;
                  betaBranch = "x86-64";
                };

                "Gloomwood" = {
                  id = 1150760;
                };

                "Goat Simulator Remastered" = {
                  id = 1762930;
                };

                "Graveyard Keeper" = {
                  id = 599140;
                };

                "Gravity Circuit" = {
                  id = 858710;
                };

                "Hades" = {
                  id = 1145360;
                };

                "Happy Humble Burger Farm" = {
                  id = 1433340;
                };

                "Hard Truck 2" = {
                  id = 4487840;
                  language = "russian";
                };

                "Hollow Knight" = {
                  id = 367520;
                };

                "Hollow Knight: Silksong" = {
                  id = 1030300;
                };

                "Hrot" = {
                  id = 824600;
                };

                "Intravenous 2" = {
                  id = 2608270;
                };

                "Intravenous" = {
                  id = 1486630;
                };

                "Ion Fury" = {
                  id = 562860;
                };

                "Iq Under Construction" = {
                  id = 3771740;
                };

                "Jalopy" = {
                  id = 446020;
                };

                "Killer Frequency" = {
                  id = 1903620;
                  language = "russian";
                };

                "Kynseed" = {
                  id = 758870;
                };

                "LEGO: Batman Beyond Gotham" = {
                  id = 313690;
                };

                "LEGO: Bricktales" = {
                  id = 1898290;
                  language = "russian";
                };

                "LEGO: Builders Journey" = {
                  id = 1544360;
                };

                "LEGO: DC Super Villains" = {
                  id = 829110;
                  language = "russian";
                };

                "LEGO: Worlds" = {
                  id = 332310;
                  language = "russian";
                };

                "Lucid Blocks" = {
                  id = 3495730;
                };

                "Midbourne" = {
                  id = 2355150;
                };

                "Midnight Snack" = {
                  id = 3363200;
                };

                "Mindustry" = {
                  id = 1127400;
                };

                "Minecraft Dungeons" = {
                  id = 1672970;
                };

                "Minecraft Legends" = {
                  id = 1928870;
                };

                "My Summer Car" = {
                  id = 516750;
                };

                "My Winter Car" = {
                  id = 4164420;
                };

                "Necesse" = {
                  id = 1169040;
                  language = "russian";
                };

                "Need For Speed" = {
                  id = 1262540;
                  language = "russian";
                };

                "Need For Speed: Heat" = {
                  id = 1222680;
                  language = "russian";
                };

                "Noexistence You Me" = {
                  id = 2873080;
                };

                "Noita" = {
                  id = 881100;
                };

                "One Million Fatal Guns" = {
                  id = 155710;
                };

                "Ori and the Blind Forest - Definitive Edition" = {
                  id = 387290;
                  language = "russian";
                };

                "Ori and the Blind Forest" = {
                  id = 261570;
                  language = "russian";
                };

                "Ori and the Will of the Wisps" = {
                  id = 1057090;
                };

                "Overcooked 2" = {
                  id = 728880;
                  language = "russian";
                };

                "Overcooked" = {
                  id = 448510;
                };

                "Paralives" = {
                  id = 1118520;
                };

                "Pathogenic" = {
                  id = 3808690;
                };

                "Plastic Warfare" = {
                  id = 490640;
                };

                "Project Warlock 2" = {
                  id = 1640300;
                };

                "Project Zomboid" = {
                  id = 108600;
                  betaBranch = "unstable";
                };

                "REPO" = {
                  id = 3214660;
                };

                "S&box" = {
                  id = 590830;
                };

                "SULFUR" = {
                  id = 2124120;
                };

                "Saints Row: The Third Remastered" = {
                  id = 978300;
                  language = "russian";
                };

                "Satisfactory" = {
                  id = 526870;
                };

                "Selaco" = {
                  id = 1592280;
                };

                "Serious Sam Tormental" = {
                  id = 640340;
                };

                "Shapez 2 - factory" = {
                  id = 2162800;
                };

                "Shapez" = {
                  id = 1318690;
                };

                "Sleeping Dogs" = {
                  id = 307690;
                  language = "russian";
                };

                "Snacktorio" = {
                  id = 1902940;
                };

                "Space Haven" = {
                  id = 979110;
                };

                "Starbound" = {
                  id = 211820;
                };

                "Stick It to the Stickman" = {
                  id = 2085540;
                  language = "russian";
                };

                "Storebound" = {
                  id = 3417410;
                };

                "Streets Of Rouge" = {
                  id = 512900;
                  language = "russian";
                };

                "Summer In Mara" = {
                  id = 962580;
                };

                "Sunset Overdrive" = {
                  id = 847370;
                  language = "russian";
                };

                "Supraball" = {
                  id = 321400;
                };

                "Supraland Six Inches Under" = {
                  id = 1522870;
                };

                "Supraland" = {
                  id = 813630;
                };

                "TABS" = {
                  id = 508440;
                };

                "Terraria" = {
                  id = 105600;
                };

                "The Binding Of Isaac: Rebirth" = {
                  id = 250900;
                };

                "The Elder Scrolls III: Morrowind" = {
                  id = 22320;
                };

                "The Elder Scrolls IV: Oblivion" = {
                  id = 22330;
                };

                "The Elder Scrolls V: Skyrim" = {
                  id = 489830;
                  language = "russian";
                };

                "The Escapists 2" = {
                  id = 641990;
                  language = "russian";
                };

                "The Escapists" = {
                  id = 298630;
                  language = "russian";
                };

                "The Long Dark" = {
                  id = 305620;
                };

                "The Survivalists" = {
                  id = 897450;
                  language = "russian";
                };

                "The Witcher 3" = {
                  id = 292030;
                  language = "russian";
                };

                "Theotown" = {
                  id = 1084020;
                };

                "Torchlight II" = {
                  id = 200710;
                };

                "Torchlight" = {
                  id = 41500;
                };

                "Valheim" = {
                  id = 892970;
                };

                "Warhammer 40.000: Boltgun" = {
                  id = 2005010;
                };

                "Watch Dogs" = {
                  id = 243470;
                  language = "russian";
                };

                "Webbed" = {
                  id = 1390350;
                  language = "russian";
                };

                "Worms Wmd" = {
                  id = 327030;
                  language = "russian";
                };

                "Wrath: Aeon of Ruin" = {
                  id = 1000410;
                };

                "Your Only Move is Hustle" = {
                  id = 2212330;
                };
                # keep-sorted end
              }
            )
          ];
        };
      };
  };
}

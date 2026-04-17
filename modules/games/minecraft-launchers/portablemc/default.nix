# INFO:
# portable minecraft launcher

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          persist.user.directories = [ ".minecraft" ];

          hmPackages = [ pkgs.portablemc ];

          hm.home.file = {
            ".minecraft/options.txt".text = lib.minecraft.genOptions {
              # keep-sorted start block=yes
              "advancedItemTooltips" = false;
              "allowCursorChanges" = true;
              "allowServerListing" = true;
              "ao" = true;
              "attackIndicator" = 1;
              "autoJump" = false;
              "autoSuggestions" = true;
              "backgroundForChatOnly" = true;
              "biomeBlendRadius" = 2;
              "bobView" = true;
              "chatColors" = true;
              "chatDelay" = 0.0;
              "chatHeightFocused" = 1.0;
              "chatHeightUnfocused" = 0.44190140845070425;
              "chatLineSpacing" = 0.0;
              "chatLinks" = true;
              "chatLinksPrompt" = true;
              "chatOpacity" = 1.0;
              "chatScale" = 1.0;
              "chatVisibility" = 0;
              "chatWidth" = 0.573943661971831;
              "chunkSectionFadeInTime" = 0.75;
              "cloudRange" = 64;
              "cutoutLeaves" = true;
              "damageTiltStrength" = 1.0;
              "darkMojangStudiosBackground" = false;
              "darknessEffectScale" = 1.0;
              "directionalAudio" = false;
              "discrete_mouse_scroll" = false;
              "enableVsync" = true;
              "entityDistanceScaling" = 1.0;
              "entityShadows" = true;
              "exclusiveFullscreen" = false;
              "forceUnicodeFont" = false;
              "fov" = 0.0;
              "fovEffectScale" = 1.0;
              "fullscreen" = false;
              "gamma" = 0.5;
              "glDebugVerbosity" = 1;
              "glintSpeed" = 0.5;
              "glintStrength" = 0.75;
              "graphicsPreset" = "fancy";
              "guiScale" = 0;
              "hideLightningFlashes" = false;
              "hideMatchedNames" = true;
              "hideServerAddress" = false;
              "hideSplashTexts" = false;
              "highContrast" = false;
              "highContrastBlockOutline" = false;
              "improvedTransparency" = false;
              "inactivityFpsLimit" = "afk";
              "incompatibleResourcePacks" = [ ];
              "invertXMouse" = false;
              "invertYMouse" = false;
              "japaneseGlyphVariants" = false;
              "joinedFirstServer" = true;
              "key_key.advancements" = "key.keyboard.l";
              "key_key.attack" = "key.mouse.left";
              "key_key.back" = "key.keyboard.s";
              "key_key.chat" = "key.keyboard.tab";
              "key_key.command" = "key.keyboard.slash";
              "key_key.debug.clearChat" = "key.keyboard.d";
              "key_key.debug.copyLocation" = "key.keyboard.c";
              "key_key.debug.copyRecreateCommand" = "key.keyboard.i";
              "key_key.debug.crash" = "key.keyboard.c";
              "key_key.debug.debugOptions" = "key.keyboard.f6";
              "key_key.debug.dumpDynamicTextures" = "key.keyboard.s";
              "key_key.debug.dumpVersion" = "key.keyboard.v";
              "key_key.debug.focusPause" = "key.keyboard.p";
              "key_key.debug.fpsCharts" = "key.keyboard.2";
              "key_key.debug.lightmapTexture" = "key.keyboard.4";
              "key_key.debug.modifier" = "key.keyboard.f3";
              "key_key.debug.networkCharts" = "key.keyboard.3";
              "key_key.debug.overlay" = "key.keyboard.f3";
              "key_key.debug.profiling" = "key.keyboard.l";
              "key_key.debug.profilingChart" = "key.keyboard.1";
              "key_key.debug.reloadChunk" = "key.keyboard.a";
              "key_key.debug.reloadResourcePacks" = "key.keyboard.t";
              "key_key.debug.showAdvancedTooltips" = "key.keyboard.h";
              "key_key.debug.showChunkBorders" = "key.keyboard.g";
              "key_key.debug.showHitboxes" = "key.keyboard.b";
              "key_key.debug.spectate" = "key.keyboard.n";
              "key_key.debug.switchGameMode" = "key.keyboard.f4";
              "key_key.drop" = "key.keyboard.q";
              "key_key.forward" = "key.keyboard.w";
              "key_key.fullscreen" = "key.keyboard.f11";
              "key_key.hotbar.1" = "key.keyboard.1";
              "key_key.hotbar.2" = "key.keyboard.2";
              "key_key.hotbar.3" = "key.keyboard.3";
              "key_key.hotbar.4" = "key.keyboard.4";
              "key_key.hotbar.5" = "key.keyboard.5";
              "key_key.hotbar.6" = "key.keyboard.6";
              "key_key.hotbar.7" = "key.keyboard.7";
              "key_key.hotbar.8" = "key.keyboard.8";
              "key_key.hotbar.9" = "key.keyboard.9";
              "key_key.inventory" = "key.keyboard.e";
              "key_key.jump" = "key.keyboard.space";
              "key_key.left" = "key.keyboard.a";
              "key_key.loadToolbarActivator" = "key.keyboard.unknown";
              "key_key.pickItem" = "key.mouse.middle";
              "key_key.playerlist" = "key.keyboard.period";
              "key_key.quickActions" = "key.keyboard.g";
              "key_key.right" = "key.keyboard.d";
              "key_key.saveToolbarActivator" = "key.keyboard.unknown";
              "key_key.screenshot" = "key.keyboard.f2";
              "key_key.smoothCamera" = "key.keyboard.unknown";
              "key_key.sneak" = "key.keyboard.c";
              "key_key.socialInteractions" = "key.keyboard.comma";
              "key_key.spectatorHotbar" = "key.mouse.middle";
              "key_key.spectatorOutlines" = "key.keyboard.unknown";
              "key_key.sprint" = "key.keyboard.left.shift";
              "key_key.toggleGui" = "key.keyboard.f1";
              "key_key.togglePerspective" = "key.keyboard.f5";
              "key_key.toggleSpectatorShaderEffects" = "key.keyboard.f4";
              "key_key.use" = "key.mouse.right";
              "lang" = "en_us";
              "lastServer" = toString null;
              "mainHand" = "right";
              "maxAnisotropyBit" = 1;
              "maxFps" = 120;
              "menuBackgroundBlurriness" = 5;
              "mipmapLevels" = 4;
              "modelPart_cape" = true;
              "modelPart_hat" = true;
              "modelPart_jacket" = true;
              "modelPart_left_pants_leg" = true;
              "modelPart_left_sleeve" = true;
              "modelPart_right_pants_leg" = true;
              "modelPart_right_sleeve" = true;
              "mouseSensitivity" = 0.5;
              "mouseWheelSensitivity" = 1.0;
              "musicFrequency" = "DEFAULT";
              "musicToast" = "never";
              "narrator" = 0;
              "narratorHotkey" = true;
              "notificationDisplayTime" = 1.0;
              "onboardAccessibility" = false;
              "onlyShowSecureChat" = false;
              "operatorItemsTab" = true;
              "overrideHeight" = 0;
              "overrideWidth" = 0;
              "panoramaScrollSpeed" = 1.0;
              "particles" = 0;
              "pauseOnLostFocus" = true;
              "prioritizeChunkUpdates" = 1;
              "rawMouseInput" = true;
              "realmsNotifications" = true;
              "reducedDebugInfo" = false;
              "renderClouds" = "true";
              "renderDistance" = 16;
              "resourcePacks" = [ "vanilla" ];
              "rotateWithMinecart" = false;
              "saveChatDrafts" = false;
              "screenEffectScale" = 1.0;
              "showAutosaveIndicator" = true;
              "showSubtitles" = false;
              "simulationDistance" = 12;
              "skipMultiplayerWarning" = false;
              "soundCategory_ambient" = 1.0;
              "soundCategory_block" = 1.0;
              "soundCategory_hostile" = 1.0;
              "soundCategory_master" = 0.8029801324503312;
              "soundCategory_music" = 1.0;
              "soundCategory_neutral" = 1.0;
              "soundCategory_player" = 1.0;
              "soundCategory_record" = 1.0;
              "soundCategory_ui" = 1.0;
              "soundCategory_voice" = 1.0;
              "soundCategory_weather" = 1.0;
              "soundDevice" = "";
              "sprintWindow" = 7;
              "startedCleanly" = true;
              "syncChunkWrites" = false;
              "telemetryOptInExtra" = false;
              "textBackgroundOpacity" = 0.5;
              "textureFiltering" = 1;
              "toggleAttack" = false;
              "toggleCrouch" = false;
              "toggleSprint" = false;
              "toggleUse" = false;
              "touchscreen" = false;
              "tutorialStep" = "none";
              "useNativeTransport" = true;
              "vignette" = true;
              "weatherRadius" = 10;
              # keep-sorted end
              "version" = 5000;
            };
          };
        };
    };
}

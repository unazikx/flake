{ buildFirefoxXpiAddon, lib }:
  {
    "bitwarden-password-manager" = buildFirefoxXpiAddon {
      pname = "bitwarden-password-manager";
      version = "2025.12.1";
      addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4664623/bitwarden_password_manager-2025.12.1.xpi";
      sha256 = "a7a123eee4e40fdd8af7c0c67243731ddcc37ae1498cf2828995f4905600c51f";
      meta = with lib;
      {
        homepage = "https://bitwarden.com";
        description = "At home, at work, or on the go, Bitwarden easily secures all your passwords, passkeys, and sensitive information.";
        license = licenses.gpl3;
        mozPermissions = [
          "<all_urls>"
          "*://*/*"
          "alarms"
          "clipboardRead"
          "clipboardWrite"
          "contextMenus"
          "idle"
          "storage"
          "tabs"
          "unlimitedStorage"
          "webNavigation"
          "webRequest"
          "webRequestBlocking"
          "notifications"
          "file:///*"
        ];
        platforms = platforms.all;
      };
    };
    "darkreader" = buildFirefoxXpiAddon {
      pname = "darkreader";
      version = "4.9.119";
      addonId = "addon@darkreader.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/4665768/darkreader-4.9.119.xpi";
      sha256 = "261a422f2fcf83ee320ac7a2809d926b8637fbadece8a5758b825bd0602944be";
      meta = with lib;
      {
        homepage = "https://darkreader.org/";
        description = "Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing.";
        license = licenses.mit;
        mozPermissions = [
          "alarms"
          "contextMenus"
          "storage"
          "tabs"
          "theme"
          "<all_urls>"
        ];
        platforms = platforms.all;
      };
    };
    "keepassxc-browser" = buildFirefoxXpiAddon {
      pname = "keepassxc-browser";
      version = "1.9.11";
      addonId = "keepassxc-browser@keepassxc.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/4628286/keepassxc_browser-1.9.11.xpi";
      sha256 = "bee523ac8d968d36ae3ae317b12b1b2bbe85e2c6f5b9ddb0fb822c2d90af6139";
      meta = with lib;
      {
        homepage = "https://keepassxc.org/";
        description = "Official browser plugin for the KeePassXC password manager (https://keepassxc.org).";
        license = licenses.gpl3;
        mozPermissions = [
          "activeTab"
          "clipboardWrite"
          "contextMenus"
          "cookies"
          "nativeMessaging"
          "notifications"
          "storage"
          "tabs"
          "webNavigation"
          "webRequest"
          "webRequestBlocking"
          "https://*/*"
          "http://*/*"
          "https://api.github.com/"
          "<all_urls>"
        ];
        platforms = platforms.all;
      };
    };
    "libredirect" = buildFirefoxXpiAddon {
      pname = "libredirect";
      version = "3.2.0";
      addonId = "7esoorv3@alefvanoon.anonaddy.me";
      url = "https://addons.mozilla.org/firefox/downloads/file/4522826/libredirect-3.2.0.xpi";
      sha256 = "ba4cf8fe97275d7082fea085a09796481122845455df1af524a7210fff3ecf3c";
      meta = with lib;
      {
        homepage = "https://libredirect.github.io";
        description = "Redirects YouTube, Twitter, TikTok... requests to alternative privacy friendly frontends.";
        license = licenses.gpl3;
        mozPermissions = [
          "webRequest"
          "webRequestBlocking"
          "storage"
          "clipboardWrite"
          "contextMenus"
          "<all_urls>"
        ];
        platforms = platforms.all;
      };
    };
    "mal-sync" = buildFirefoxXpiAddon {
      pname = "mal-sync";
      version = "0.12.2";
      addonId = "{c84d89d9-a826-4015-957b-affebd9eb603}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4617271/mal_sync-0.12.2.xpi";
      sha256 = "77e07258ef6e7245e8ddaee0e8dcca0dd8d1820f614c1b3d3b2573a2e6db5391";
      meta = with lib;
      {
        homepage = "https://github.com/lolamtisch/MALSync";
        description = "MAL-Sync enables automatic episode tracking between MyAnimeList/Anilist/Kitsu/Simkl and multiple anime streaming websites.";
        license = licenses.gpl3;
        mozPermissions = [
          "storage"
          "alarms"
          "notifications"
          "declarativeNetRequestWithHostAccess"
          "*://myanimelist.net/anime/*"
          "*://myanimelist.net/manga/*"
          "*://myanimelist.net/animelist/*"
          "*://myanimelist.net/mangalist/*"
          "*://myanimelist.net/anime.php?id=*"
          "*://myanimelist.net/manga.php?id=*"
          "*://myanimelist.net/character/*"
          "*://myanimelist.net/people/*"
          "*://myanimelist.net/search/*"
          "*://malsync.moe/mal/oauth*"
          "*://malsync.moe/anilist/oauth*"
          "*://malsync.moe/shikimori/oauth*"
          "*://anilist.co/*"
          "*://kitsu.app/*"
          "*://simkl.com/*"
          "*://malsync.moe/pwa*"
          "*://mangadex.org/*"
          "*://*.www.turkanime.tv/video/*"
          "*://*.www.turkanime.tv/anime/*"
          "*://*.www.turkanime.net/video/*"
          "*://*.www.turkanime.net/anime/*"
          "*://*.www.turkanime.co/video/*"
          "*://*.www.turkanime.co/anime/*"
          "*://app.emby.media/*"
          "*://app.emby.tv/*"
          "*://app.plex.tv/*"
          "*://www.netflix.com/*"
          "*://*.animeflv.net/anime/*"
          "*://*.animeflv.net/ver/*"
          "*://jkanime.net/*"
          "*://proxer.me/*"
          "*://proxer.net/*"
          "*://*.aniflix.tv/*"
          "*://*.aniflix.cc/*"
          "*://*.kaas.am/*"
          "*://*.kaas.ro/*"
          "*://*.kaas.to/*"
          "*://*.kickassanime.ro/*"
          "*://*.kickassanime.am/*"
          "*://*.kickassanimes.io/*"
          "*://*.kickassanime.mx/*"
          "*://*.kaa.mx/*"
          "*://*.kaa.to/*"
          "*://shinden.pl/episode/*"
          "*://shinden.pl/series/*"
          "*://shinden.pl/titles/*"
          "*://shinden.pl/epek/*"
          "*://voiranime.com/*"
          "*://*.voiranime.com/*"
          "*://www.viz.com/*"
          "*://www.animezone.pl/odcinki/*"
          "*://www.animezone.pl/odcinek/*"
          "*://www.animezone.pl/anime/*"
          "*://anime-odcinki.pl/anime/*"
          "*://serimanga.com/*"
          "*://mangadenizi.com/*"
          "*://*.mangadenizi.net/*"
          "*://moeclip.com/*"
          "*://mangalivre.net/*"
          "*://tmofans.com/*"
          "*://lectortmo.com/*"
          "*://visortmo.com/*"
          "*://gastronomiaporpaises.com/*"
          "*://releasingcars.com/*"
          "*://mundorecetascuriosas.com/*"
          "*://lupitaalosfogones.com/*"
          "*://cocinarporelmundo.com/*"
          "*://disfrutacocina.com/*"
          "*://recetascuriosas.com/*"
          "*://lacocinadelupita.com/*"
          "*://mynewsrecipes.com/*"
          "*://recipestravelworld.com/*"
          "*://recipestraveling.com/*"
          "*://recetaspaises.com/*"
          "*://worldrecipesu.com/*"
          "*://techinroll.com/*"
          "*://vsrecipes.com/*"
          "*://mygamesinfo.com/*"
          "*://gamesnk.com/*"
          "*://otakuworldgames.com/*"
          "*://animalcanine.com/*"
          "*://cook2love.com/*"
          "*://wtechnews.com/*"
          "*://animationforyou.com/*"
          "*://fanaticmanga.com/*"
          "*://mistermanga.com/*"
          "*://enginepassion.com/*"
          "*://motornk.com/*"
          "*://recipesnk.com/*"
          "*://panicmanga.com/*"
          "*://worldmangas.com/*"
          "*://anitoc.com/*"
          "*://cookerready.com/*"
          "*://cooker2love.com/*"
          "*://infopetworld.com/*"
          "*://infogames2you.com/*"
          "*://almtechnews.com/*"
          "*://animation2you.com/*"
          "*://recipesdo.com/*"
          "*://vgmotor.com/*"
          "*://myotakuinfo.com/*"
          "*://otakworld.com/*"
          "*://cookermania.com/*"
          "*://motorbakery.com/*"
          "*://recipesist.com/*"
          "*://motorpi.com/*"
          "*://dariusmotor.com/*"
          "*://recipesaniki.com/*"
          "*://cocinaconlupita.com/*"
          "*://recetasdelupita.com/*"
          "*://gamesxo.com/*"
          "*://fitfooders.com/*"
          "*://checkingcars.com/*"
          "*://keepfooding.com/*"
          "*://feelthecook.com/*"
          "*://recetchef.com/*"
          "*://motoroilblood.com/*"
          "*://anisurion.com/*"
          "*://recipescoaching.com/*"
          "*://anitirion.com/*"
          "*://cookernice.com/*"
          "*://animalsside.com/*"
          "*://paleomotor.com/*"
          "*://otakunice.com/*"
          "*://sucrecipes.com/*"
          "*://recetasviaje.com/*"
          "*://animalslegacy.com/*"
          "*://worldcuisineis.com/*"
          "*://eligeunnombre.com/*"
          "*://cyclingresolution.com/*"
          "*://comollamarle.com/*"
          "*://fashionandcomplements.com/*"
          "*://gamesnacion.com/*"
          "*://topamotor.com/*"
          "*://motorwithpassion.com/*"
          "*://gamesnewses.com/*"
          "*://technewsroll.com/*"
          "*://infonombre.com/*"
          "*://animationdraw.com/*"
          "*://recetasdegina.com/*"
          "*://mislyfashion.com/*"
          "*://techingro.com/*"
          "*://motoralm.com/*"
          "*://tocanimation.com/*"
          "*://letsmotorgo.com/*"
          "*://zonatmo.com/*"
          "*://*.japscan.ws/*"
          "*://www.hulu.com/*"
          "*://www.hidive.com/*"
          "*://mangakatana.com/manga/*"
          "*://*.manga4life.com/*"
          "*://animexin.vip/*"
          "*://animexin.xyz/*"
          "*://animexinax.com/*"
          "*://animexin.top/*"
          "*://animexin.dev/*"
          "*://monoschinos.com/*"
          "*://monoschinos2.com/*"
          "*://smotret-anime.org/catalog/*"
          "*://smotret-anime.online/catalog/*"
          "*://smotret-anime.com/catalog/*"
          "*://anime365.ru/catalog/*"
          "*://anime-365.ru/catalog/*"
          "*://smotret-anime.ru/catalog/*"
          "*://smotretanime.ru/catalog/*"
          "*://animefire.net/*"
          "*://animefire.plus/*"
          "*://otakufr.co/*"
          "*://otakufr.cc/*"
          "*://mangatx.com/*"
          "*://manhuafast.com/*"
          "*://tranimeizle.net/*"
          "*://www.tranimeizle.net/*"
          "*://tranimeizle.co/*"
          "*://www.tranimeizle.co/*"
          "*://*.tranimeizle.top/*"
          "*://tranimeizle.io/*"
          "*://www.tranimeizle.io/*"
          "*://*.animestreamingfr.fr/*"
          "*://furyosociety.com/*"
          "*://www.animeid.tv/*"
          "*://myanimelist.net/anime/*/*/episode/*"
          "*://*.animeunity.it/anime/*"
          "*://*.animeunity.tv/anime/*"
          "*://*.animeunity.cc/anime/*"
          "*://*.animeunity.to/anime/*"
          "*://*.animeunity.so/anime/*"
          "*://*.mangahere.cc/manga/*"
          "*://*.fanfox.net/manga/*"
          "*://*.mangafox.la/manga/*"
          "*://desu-online.pl/*"
          "*://wuxiaworld.site/novel/*"
          "*://reaperscans.com/*"
          "*://lynxscans.com/*"
          "*://reader.deathtollscans.net/*"
          "*://manhuaplus.com/manga*"
          "*://readm.org/manga/*"
          "*://www.readm.org/manga/*"
          "*://*.readm.today/manga/*"
          "*://tioanime.com/anime/*"
          "*://tioanime.com/ver/*"
          "*://*.mangasee123.com/manga*"
          "*://*.mangasee123.com/read-online*"
          "*://*.okanime.com/animes/*"
          "*://*.okanime.com/movies/*"
          "*://*.okanime.tv/animes/*"
          "*://*.okanime.tv/movies/*"
          "*://bs.to/serie/*"
          "*://an1me.nl/*"
          "*://an1me.to/*"
          "*://mangajar.com/manga/*"
          "*://mangajar.pro/manga/*"
          "*://*.otakustv.com/anime/*"
          "*://demo.komga.org/*"
          "*://animewho.com/*"
          "*://fumetsu.pl/anime/*"
          "*://frixysubs.pl/*"
          "*://guya.moe/*"
          "*://cubari.moe/*"
          "*://guya.cubari.moe/*"
          "*://mangahub.io/*"
          "*://www.bentomanga.com/*"
          "*://bentomanga.com/*"
          "*://readmanhua.net/manga*"
          "*://immortalupdates.com/manga*"
          "*://aniwatch.to/*"
          "*://aniwatch.nz/*"
          "*://aniwatch.se/*"
          "*://hianime.to/*"
          "*://hianime.nz/*"
          "*://hianime.mn/*"
          "*://hianime.sx/*"
          "*://hianime.bz/*"
          "*://hianime.pe/*"
          "*://hianimez.to/*"
          "*://hianimez.is/*"
          "*://hianime.cx/*"
          "*://hianime.gs/*"
          "*://hianime.do/*"
          "*://lhtranslation.net/manga*"
          "*://mangas-origines.fr/oeuvre*"
          "*://*.bluesolo.org/manga/*"
          "*://disasterscans.com/*"
          "*://dynasty-scans.com/*"
          "*://aniworld.to/*"
          "*://betteranime.net/anime/*"
          "*://*.manga.bilibili.com/*"
          "*://mangareader.to/*"
          "*://animeonsen.xyz/*"
          "*://www.animeonsen.xyz/*"
          "*://*.animetoast.cc/*"
          "*://*.animeworld.tv/play/*"
          "*://*.animeworld.so/play/*"
          "*://*.animeworld.ac/play/*"
          "*://mangabuddy.com/*"
          "*://vvww.toonanime.cc/*"
          "*://*.adkami.com/*"
          "*://kaguya.app/*"
          "*://hdrezka.ag/animation/*"
          "*://sovetromantica.com/anime/*"
          "*://ani.wtf/anime/*"
          "*://animationdigitalnetwork.fr/*"
          "*://animationdigitalnetwork.de/*"
          "*://animationdigitalnetwork.com/*"
          "*://aniyan.net/*"
          "*://docchi.pl/*"
          "*://fmteam.fr/*"
          "*://www.animelon.com/*"
          "*://animelon.com/*"
          "*://anime-sama.fr/*"
          "*://anime-sama.org/*"
          "*://mangafire.to/*"
          "*://projectsuki.com/*"
          "*://animebuff.ru/anime/*"
          "*://animeonegai.com/*"
          "*://www.animeonegai.com/*"
          "*://*.animeko.co/*"
          "*://animego.org/anime/*"
          "*://animego.me/anime/*"
          "*://*.luciferdonghua.in/*"
          "*://*.luciferdonghua.co.in/*"
          "*://neoxscans.com/*"
          "*://*.neoxscans.net/*"
          "*://www.hinatasoul.com/anime*"
          "*://www.hinatasoul.com/videos/*"
          "*://ogladajanime.pl/*"
          "*://hachi.moe/*"
          "*://witanime.sbs/*"
          "*://witanime.pics/*"
          "*://suwayomi-webui-preview.github.io/*"
          "*://manhuaus.com/*"
          "*://*.taiyo.moe/*"
          "*://*.animesonline.in/*"
          "*://latanime.org/*"
          "*://*.mangaread.org/manga/*"
          "*://templescan.net/*"
          "*://demo.kavitareader.com/*"
          "*://aninexus.to/*"
          "*://*.anidream.cc/*"
          "*://*.openload.co/*"
          "*://*.openload.pw/*"
          "*://*.streamango.com/*"
          "*://*.mp4upload.com/*"
          "*://*.mcloud.to/*"
          "*://*.mcloud.bz/*"
          "*://*.static.crunchyroll.com/*"
          "*://*.vidstreaming.io/*"
          "*://*.vidstreaming.link/*"
          "*://*.xstreamcdn.com/*"
          "*://*.gcloud.live/*"
          "*://*.oload.tv/*"
          "*://*.mail.ru/*"
          "*://*.myvi.ru/*"
          "*://*.myvi.tv/*"
          "*://*.sibnet.ru/*"
          "*://*.tune.pk/*"
          "*://*.tune.ke/*"
          "*://*.vimple.ru/*"
          "*://*.href.li/*"
          "*://*.vk.com/*"
          "*://*.cloudvideo.tv/*"
          "*://*.fembed.net/*"
          "*://*.fembed.com/*"
          "*://*.animeproxy.info/*"
          "*://*.feurl.com/*"
          "*://*.embedsito.com/v/*"
          "*://*.fcdn.stream/v/*"
          "*://*.fcdn.stream/e/*"
          "*://*.vaplayer.xyz/v/*"
          "*://*.vaplayer.xyz/e/*"
          "*://*.femax20.com/v/*"
          "*://*.femax20.com/e/*"
          "*://*.fplayer.info/*"
          "*://*.dutrag.com/*"
          "*://*.diasfem.com/*"
          "*://*.fembed-hd.com/*"
          "*://*.fembed9hd.com/*"
          "*://suzihaza.com/v/*"
          "*://vanfem.com/v/*"
          "*://*.youpload.co/*"
          "*://*.yourupload.com/*"
          "*://*.vidlox.me/*"
          "*://*.kwik.cx/*"
          "*://*.kwik.si/*"
          "*://*.mega.nz/*"
          "*://*.animeflv.net/*"
          "*://*.jwplayerhls.com/*"
          "*://*.hqq.tv/*"
          "*://waaw.tv/*"
          "*://*.jkanime.net/*"
          "*://*.ok.ru/*"
          "*://*.novelplanet.me/*"
          "*://*.stream.proxer.me/*"
          "*://*.stream.proxer.net/*"
          "*://*.stream-service.proxer.me/*"
          "*://verystream.com/*"
          "*://*.animeultima.eu/e/*"
          "*://*.animeultima.eu/faststream/*"
          "*://*.animeultima.to/e/*"
          "*://*.animeultima.to/faststream/*"
          "*://*.vidoza.net/*"
          "*://*.videzz.net/*"
          "*://gounlimited.to/*"
          "*://www.ani-stream.com/*"
          "*://animedaisuki.moe/embed/*"
          "*://www.dailymotion.com/embed/*"
          "*://geo.dailymotion.com/*"
          "*://vev.io/embed/*"
          "*://vev.red/embed/*"
          "*://jwpstream.com/jwps/yplayer.php*"
          "*://www.vaplayer.xyz/v/*"
          "*://vaplayer.me/*"
          "*://mp4.sh/embed/*"
          "*://embed.mystream.to/*"
          "*://*.bitchute.com/embed/*"
          "*://*.streamcherry.com/embed/*"
          "*://*.clipwatching.com/*"
          "*://*.flix555.com/*"
          "*://*.vshare.io/v/*"
          "*://ebd.cda.pl/*"
          "*://www.lycoris.cafe/*"
          "*://*.replay.watch/*"
          "*://*.playhydrax.com/*"
          "*://hydrax.net/*"
          "*://*.geoip.redirect-ads.com/*"
          "*://*.streamium.xyz/*"
          "*://kodik.info/*"
          "*://aniboom.one/*"
          "*://x.anizium.co/*"
          "*://smotret-anime.org/translations/embed/*"
          "*://smotret-anime.online/translations/embed/*"
          "*://smotret-anime.com/translations/embed/*"
          "*://anime365.ru/translations/embed/*"
          "*://anime-365.ru/translations/embed/*"
          "*://*.pstream.net/e/*"
          "*://fusevideo.net/e/*"
          "*://fusevideo.io/e/*"
          "*://*.animefever.tv/embed/*"
          "*://*.haloani.ru/*"
          "*://*.moeclip.com/v/*"
          "*://*.moeclip.com/embed/*"
          "*://*.mixdrop.co/e/*"
          "*://*.mixdrop.to/e/*"
          "*://*.mdbekjwqa.pw/e/*"
          "*://*.mdfx9dc8n.net/e/*"
          "*://*.mdzsmutpcvykb.net/e/*"
          "*://*.mixdropjmk.pw/e/*"
          "*://*.mixdrop21.net/e/*"
          "*://*.mixdrop.si/e/*"
          "*://*.mixdrop.nu/e/*"
          "*://*.mixdrop.sx/e/*"
          "*://*.mixdrop.ms/e/*"
          "*://*.mixdrop.ps/e/*"
          "*://*.mixdrop.my/e/*"
          "*://*.mixdrop.sn/e/*"
          "*://*.mixdrop.cv/e/*"
          "*://*.md3b0j6hj.com/e/*"
          "*://gdriveplayer.me/embed*"
          "*://sendvid.net/v/*"
          "*://sendvid.com/embed/*"
          "*://streamz.cc/*"
          "*://*.vidbm.com/embed-*"
          "*://*.vidbem.com/embed-*"
          "*://*.cloudhost.to/*/mediaplayer/*/_embed.php?*"
          "*://*.letsupload.co/*/mediaplayer/*/_embed.php?*"
          "*://streamtape.com/*"
          "*://streamtape.net/*"
          "*://streamtape.xyz/*"
          "*://streamtape.to/*"
          "*://strcloud.in/*"
          "*://strcloud.link/*"
          "*://streamta.pe/*"
          "*://strtape.tech/*"
          "*://strtapeadblock.club/*"
          "*://strtapeadblock.me/*"
          "*://streamta.site/*"
          "*://scloud.online/*"
          "*://strtpe.link/*"
          "*://stape.me/*"
          "*://stape.fun/*"
          "*://streamtapeadblock.art/*"
          "*://reproductor.monoschinos.com/*"
          "*://uptostream.com/iframe/*"
          "*://easyload.io/e/*"
          "*://*.googleusercontent.com/gadgets/*"
          "*://animedesu.pl/player/desu.php?v=*"
          "*://animevost.org/frame5.php?play=*"
          "*://*.plyr.link/*"
          "*://v.vvid.cc/*"
          "*://*.okanime.com/cdn/*/embed/?*"
          "*://*.gogo-stream.com/*"
          "*://*.gogo-play.net/*"
          "*://*.gogo-play.tv/*"
          "*://*.streamani.net/*"
          "*://*.streamani.io/*"
          "*://*.goload.one/*"
          "*://*.goload.pro/*"
          "*://*.goload.io/*"
          "*://*.gogoplay1.com/*"
          "*://*.gogoplay2.com/*"
          "*://*.gogoplay4.com/*"
          "*://*.gogoplay5.com/*"
          "*://*.gogoplay.io/*"
          "*://*.gogohd.net/*"
          "*://*.gogohd.pro/*"
          "*://*.gembedhd.com/*"
          "*://*.playgo1.cc/*"
          "*://*.anihdplay.com/*"
          "*://*.playtaku.net/*"
          "*://*.playtaku.online/*"
          "*://*.gotaku1.com/*"
          "*://*.goone.pro/*"
          "*://*.embtaku.pro/*"
          "*://*.embtaku.com/*"
          "*://*.s3taku.com/*"
          "*://*.s3embtaku.pro/*"
          "*://vivo.sx/embed/*"
          "*://play.api-web.site/*"
          "*://vidstream.pro/embed/*"
          "*://vidstream.pro/e/*"
          "*://vidstreamz.online/embed/*"
          "*://vidstreamz.online/e/*"
          "*://vizcloud.ru/embed/*"
          "*://vizcloud.ru/e/*"
          "*://vizcloud2.ru/embed/*"
          "*://vizcloud2.ru/e/*"
          "*://vizcloud.online/embed/*"
          "*://vizcloud.online/e/*"
          "*://vizstream.ru/embed/*"
          "*://vizstream.ru/e/*"
          "*://vizcloud.xyz/embed/*"
          "*://vizcloud.xyz/e/*"
          "*://vizcloud.cloud/embed/*"
          "*://vizcloud.cloud/e/*"
          "*://vizcloud.co/embed/*"
          "*://vizcloud.co/e/*"
          "*://vidplay.site/e/*"
          "*://vidplay.lol/e/*"
          "*://vidplay.online/e/*"
          "*://a9bfed0818.nl/e/*"
          "*://vid142.site/e/*"
          "*://vid1a52.site/e/*"
          "*://vid2a41.site/e/*"
          "*://streamsb.net/*"
          "*://streamsb.com/*"
          "*://sbembed.com/*"
          "*://sbembed1.com/*"
          "*://sbvideo.net/*"
          "*://sbplay.org/*"
          "*://sbplay.one/*"
          "*://sbplay1.com/*"
          "*://sbplay2.com/*"
          "*://embedsb.com/*"
          "*://watchsb.com/*"
          "*://sbplay2.xyz/*"
          "*://sbfull.com/e/*"
          "*://ssbstream.net/*"
          "*://streamsss.net/*"
          "*://sbanh.com/e/*"
          "*://sblongvu.com/e/*"
          "*://sbchill.com/e/*"
          "*://sbone.pro/e/*"
          "*://sbani.pro/e/*"
          "*://dood.to/*"
          "*://dood.watch/*"
          "*://doodstream.com/*"
          "*://dood.la/*"
          "*://*.dood.video/*"
          "*://dood.ws/e/*"
          "*://dood.sh/e/*"
          "*://dood.so/e/*"
          "*://dood.pm/e/*"
          "*://dood.wf/e/*"
          "*://dood.re/e/*"
          "*://dooood.com/e/*"
          "*://dood.li/e/*"
          "*://youtube.googleapis.com/embed/*drive.google.com*"
          "*://hdvid.tv/*"
          "*://vidfast.co/*"
          "*://supervideo.tv/*"
          "*://jetload.net/*"
          "*://saruch.co/*"
          "*://vidmoly.me/*"
          "*://vidmoly.to/*"
          "*://vidmoly.net/*"
          "*://upstream.to/*"
          "*://abcvideo.cc/*"
          "*://aparat.cam/*"
          "*://www.aparat.com/video/video/embed/*"
          "*://vudeo.net/*"
          "*://voe.sx/e/*"
          "*://gamoneinterrupted.com/e/*"
          "*://crownmakermacaronicism.com/e/*"
          "*://generatesnitrosate.com/e/*"
          "*://yodelswartlike.com/e/*"
          "*://cigarlessarefy.com/e/*"
          "*://valeronevijao.com/e/*"
          "*://strawberriesporail.com/e/*"
          "*://timberwoodanotia.com/e/*"
          "*://phenomenalityuniform.com/e/*"
          "*://nonesnanking.com/e/*"
          "*://kathleenmemberhistory.com/e/*"
          "*://bradleyviewdoctor.com/e/*"
          "*://seanshowcould.com/e/*"
          "*://johntryopen.com/e/*"
          "*://morganoperationface.com/e/*"
          "*://brookethoughi.com/e/*"
          "*://jamesstartstudent.com/e/*"
          "*://ryanagoinvolve.com/e/*"
          "*://jasonresponsemeasure.com/e/*"
          "*://shannonpersonalcost.com/e/*"
          "*://brucevotewithin.com/e/*"
          "*://rebeccaneverbase.com/e/*"
          "*://loriwithinfamily.com/e/*"
          "*://bethshouldercan.com/e/*"
          "*://sandratableother.com/e/*"
          "*://robertordercharacter.com/e/*"
          "*://maxfinishseveral.com/e/*"
          "*://alejandrocenturyoil.com/e/*"
          "*://heatherwholeinvolve.com/e/*"
          "*://nathanfromsubject.com/e/*"
          "*://jennifercertaindevelopment.com/e/*"
          "*://richardsignfish.com/e/*"
          "*://sarahnewspaperbeat.com/e/*"
          "*://diananatureforeign.com/e/*"
          "*://jonathansociallike.com/e/*"
          "*://mariatheserepublican.com/e/*"
          "*://jilliandescribecompany.com/e/*"
          "*://lukesitturn.com/e/*"
          "*://mikaylaarealike.com/e/*"
          "*://vidoo.tv/*"
          "*://nxload.com/*"
          "*://videobin.co/*"
          "*://uqload.com/*"
          "*://evoload.io/*"
          "*://kaa-play.me/*"
          "*://kaavid.com/*"
          "*://vidnethub.net/*"
          "*://vidco.pro/*"
          "*://omegadthree.com/*"
          "*://krussdomi.com/*"
          "*://*.animeshouse.net/gcloud/*"
          "*://*.animeshouse.net/playerBlue/*"
          "*://*.animeshouse.net/mp4/*"
          "*://*.animeshouse.net/ah-clp-new/*"
          "*://animato.me/embed/*"
          "*://kimanime.ru/AnimeIframe/*"
          "*://vidcloud.spb.ru/*"
          "*://*.streamhd.cc/*"
          "*://*.rapid-cloud.ru/*"
          "*://*.rapid-cloud.co/*"
          "*://videovard.sx/*"
          "*://videovard.to/*"
          "*://streamlare.com/e/*"
          "*://betteranime.net/player*"
          "*://streamzz.to/*"
          "*://protonvideo.to/iframe/*"
          "*://ninjastream.to/watch/*"
          "*://harajuku.pl/*"
          "*://vupload.com/*"
          "*://*.turkanime.net/player/*"
          "*://*.turkanime.co/player/*"
          "*://*.turkanime.co/embed/*"
          "*://play.cozyplayer.com/*"
          "*://odnoklassniki.ru/*"
          "*://myalucard.xyz/*"
          "*://uploads.mobi/*"
          "*://iframe.mediadelivery.net/embed/*"
          "*://*.yfvf.com/*"
          "*://waaw.to/*"
          "*://suzihaza.com/*"
          "*://*.solidfiles.com/*"
          "*://www.animeworld.tv/api/episode/serverPlayerAnimeWorld?id=*"
          "*://www.animeworld.so/api/episode/serverPlayerAnimeWorld?id=*"
          "*://www.animeworld.ac/api/episode/serverPlayerAnimeWorld?id=*"
          "*://filemoon.sx/e/*"
          "*://filemoon.sx/lol/*"
          "*://kerapoxy.cc/e/*"
          "*://kerapoxy.cc/lol/*"
          "*://vpcxz19p.xyz/e/*"
          "*://vpcxz19p.xyz/lol/*"
          "*://filemoon.top/e/*"
          "*://filemoon.top/lol/*"
          "*://fmoonembed.pro/e/*"
          "*://fmoonembed.pro/lol/*"
          "*://rgeyyddl.skin/e/*"
          "*://rgeyyddl.skin/lol/*"
          "*://designparty.sx/e/*"
          "*://designparty.sx/lol/*"
          "*://c4qhk0je.xyz/e/*"
          "*://c4qhk0je.xyz/lol/*"
          "*://1azayf9w.xyz/e/*"
          "*://1azayf9w.xyz/lol/*"
          "*://81u6xl9d.xyz/e/*"
          "*://81u6xl9d.xyz/lol/*"
          "*://gorro-chfzoaas.fun/e/*"
          "*://gorro-chfzoaas.fun/lol/*"
          "*://z7ihwgqj.fun/*"
          "*://pqham.com/*"
          "*://mb.toonanime.xyz/dist/*"
          "*://aniyan.net/jwplayer/*"
          "*://*.googlevideo.com/videoplayback?*"
          "*://animenosub.upn.one/#*"
          "*://nova.upn.one/*"
          "*://*.streamhide.to/e/*"
          "*://megacloud.tv/*"
          "*://megacloud.club/*"
          "*://megacloud.blog/*"
          "*://vixcloud.cc/*"
          "*://vixcloud.co/*"
          "*://yonaplay.org/*"
          "*://*.4shared.com/*"
          "*://*.videa.hu/*"
          "*://*.soraplay.xyz/*"
          "*://streamwish.to/e/*"
          "*://sfastwish.com/e/*"
          "*://awish.pro/e/*"
          "*://hlswish.com/e/*"
          "*://swishsrv.com/e/*"
          "*://alions.pro/v/*"
          "*://megaf.cc/e/*"
          "*://rogeriobetin.com/*"
          "*://nvlabs-fi-cdn.q9x.in/*"
          "*://api.anivideo.net/*"
          "*://listeamed.net/*"
          "*://oneupload.to/*"
          "*://player.vimeo.com/*"
          "*://fle-rvd0i9o8-moo.com/*"
          "*://dhtpre.com/*"
          "*://*.bunniescdn.online/*"
          "*://megaup.cc/e/*"
          "*://megaup.site/e/*"
          "*://megaup.live/e/*"
          "*://4spromax.site/e/*"
          "*://boosterx.stream/*"
          "*://player.zilla-networks.com/*"
          "*://megaplay.buzz/*"
          "*://*.anizmplayer.com/*"
          "*://loadx.ws/*"
          "*://odysee.com/*"
          "*://emturbovid.com/*"
          "*://*.upns.live/*"
          "*://*.p2pstream.vip/*"
        ];
        platforms = platforms.all;
      };
    };
    "protondb-for-steam" = buildFirefoxXpiAddon {
      pname = "protondb-for-steam";
      version = "2.3.0";
      addonId = "{30280527-c46c-4e03-bb16-2e3ed94fa57c}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4490230/protondb_for_steam-2.3.0.xpi";
      sha256 = "e5ab8d594cd71c7a345a6694620ad9c4a3abb97161a191b72484f5b934ba96c5";
      meta = with lib;
      {
        homepage = "https://github.com/tryton-vanmeer/ProtonDB-for-Steam#protondb-for-steam";
        description = "Shows ratings from protondb.com on Steam";
        license = licenses.lgpl3;
        mozPermissions = [
          "https://www.protondb.com/*"
          "https://store.steampowered.com/app/*"
          "https://store.steampowered.com/wishlist/*"
          "https://steamcommunity.com/id/*/games"
          "https://steamcommunity.com/id/*/games?tab=*"
        ];
        platforms = platforms.all;
      };
    };
    "redirectnixwiki" = buildFirefoxXpiAddon {
      pname = "redirectnixwiki";
      version = "1.0";
      addonId = "redirect-nix-wiki@undesided.me";
      url = "https://addons.mozilla.org/firefox/downloads/file/4373121/redirectnixwiki-1.0.xpi";
      sha256 = "ca09df5c8bf96d6ed34ee8753decef188099ab77c2490f86ee172545236fd03f";
      meta = with lib;
      {
        homepage = "https://gitlab.com/utzuro/browser-plugins/-/tree/main/redirectNixWiki";
        description = "Redirects old \"nixos.wiki\" to the official \"wiki.nixos.org\".";
        license = licenses.mit;
        mozPermissions = [
          "webRequest"
          "webRequestBlocking"
          "*://nixos.wiki/*"
        ];
        platforms = platforms.all;
      };
    };
    "sponsorblock" = buildFirefoxXpiAddon {
      pname = "sponsorblock";
      version = "6.1.2";
      addonId = "sponsorBlocker@ajay.app";
      url = "https://addons.mozilla.org/firefox/downloads/file/4644570/sponsorblock-6.1.2.xpi";
      sha256 = "598f66c9eb6bbab2bd5f87376b632a5860f442d3694e233610f5b37f8b6e3f10";
      meta = with lib;
      {
        homepage = "https://sponsor.ajay.app";
        description = "Easily skip YouTube video sponsors. When you visit a YouTube video, the extension will check the database for reported sponsors and automatically skip known sponsors. You can also report sponsors in videos. Other browsers: https://sponsor.ajay.app";
        license = licenses.lgpl3;
        mozPermissions = [
          "storage"
          "scripting"
          "unlimitedStorage"
          "https://sponsor.ajay.app/*"
          "https://*.youtube.com/*"
          "https://www.youtube-nocookie.com/embed/*"
        ];
        platforms = platforms.all;
      };
    };
    "steam-database" = buildFirefoxXpiAddon {
      pname = "steam-database";
      version = "4.32";
      addonId = "firefox-extension@steamdb.info";
      url = "https://addons.mozilla.org/firefox/downloads/file/4657779/steam_database-4.32.xpi";
      sha256 = "89b2b812e0f4b58d34aaf2ed8fa9a186842d6c9df0636437f94aff4d2e09804c";
      meta = with lib;
      {
        homepage = "https://steamdb.info/";
        description = "Adds SteamDB links and new features on the Steam store and community. View lowest game prices and stats.";
        license = licenses.bsd2;
        mozPermissions = [
          "storage"
          "https://steamdb.info/*"
          "https://store.steampowered.com/*"
          "https://steamcommunity.com/*"
          "https://store.steampowered.com/app/*"
          "https://store.steampowered.com/news/app/*"
          "https://store.steampowered.com/account/licenses*"
          "https://store.steampowered.com/account/registerkey*"
          "https://store.steampowered.com/sub/*"
          "https://store.steampowered.com/bundle/*"
          "https://store.steampowered.com/widget/*"
          "https://store.steampowered.com/app/*/agecheck"
          "https://store.steampowered.com/agecheck/*"
          "https://store.steampowered.com/explore*"
          "https://steamcommunity.com/app/*"
          "https://steamcommunity.com/sharedfiles/filedetails*"
          "https://steamcommunity.com/workshop/filedetails*"
          "https://steamcommunity.com/workshop/browse*"
          "https://steamcommunity.com/workshop/discussions*"
          "https://steamcommunity.com/id/*"
          "https://steamcommunity.com/profiles/*"
          "https://steamcommunity.com/id/*/inventory*"
          "https://steamcommunity.com/profiles/*/inventory*"
          "https://steamcommunity.com/id/*/stats*"
          "https://steamcommunity.com/profiles/*/stats*"
          "https://steamcommunity.com/id/*/stats/CSGO*"
          "https://steamcommunity.com/profiles/*/stats/CSGO*"
          "https://steamcommunity.com/stats/*/achievements*"
          "https://steamcommunity.com/tradeoffer/*"
          "https://steamcommunity.com/id/*/recommended/*"
          "https://steamcommunity.com/profiles/*/recommended/*"
          "https://steamcommunity.com/id/*/badges*"
          "https://steamcommunity.com/profiles/*/badges*"
          "https://steamcommunity.com/id/*/gamecards/*"
          "https://steamcommunity.com/profiles/*/gamecards/*"
          "https://steamcommunity.com/market/multibuy*"
          "https://steamcommunity.com/market/*"
          "https://steamcommunity.com/games/*"
          "https://steamcommunity.com/sharedfiles/*"
          "https://steamcommunity.com/workshop/*"
          "https://steamcommunity.com/linkfilter/*"
          "https://steamcommunity.com/tradingcards/boostercreator*"
        ];
        platforms = platforms.all;
      };
    };
    "styl-us" = buildFirefoxXpiAddon {
      pname = "styl-us";
      version = "2.3.19";
      addonId = "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4661054/styl_us-2.3.19_qtD9vir.xpi";
      sha256 = "fed97d9b8cb8793d1b1f95c95abfaf7660377c0ba71d49ec48ffd3d676f66af1";
      meta = with lib;
      {
        homepage = "https://add0n.com/stylus.html";
        description = "Redesign your favorite websites with Stylus, an actively developed and community driven userstyles manager. Easily install custom themes from popular online repositories, or create, edit, and manage your own personalized CSS stylesheets.";
        license = licenses.gpl3;
        mozPermissions = [
          "alarms"
          "contextMenus"
          "storage"
          "tabs"
          "unlimitedStorage"
          "webNavigation"
          "webRequest"
          "webRequestBlocking"
          "<all_urls>"
          "https://userstyles.org/*"
        ];
        platforms = platforms.all;
      };
    };
    "torrserver-adder" = buildFirefoxXpiAddon {
      pname = "torrserver-adder";
      version = "2.0.5";
      addonId = "84z74tXJKt8OUrTD@TSA";
      url = "https://addons.mozilla.org/firefox/downloads/file/4264581/torrserver_adder-2.0.5.xpi";
      sha256 = "6783c13fe423c14fbf9dd23ea3232167dc78eeb298594ab802aa9a7b094fb365";
      meta = with lib;
      {
        homepage = "https://github.com/Noperkot/TorrServerAdder";
        description = "Allows you to add torrents to TorrServer and play them using the system media player";
        license = licenses.mpl20;
        mozPermissions = [
          "http://*/*"
          "https://*/*"
          "contextMenus"
          "downloads"
          "storage"
          "tabs"
          "webRequest"
          "webRequestBlocking"
        ];
        platforms = platforms.all;
      };
    };
    "traduzir-paginas-web" = buildFirefoxXpiAddon {
      pname = "traduzir-paginas-web";
      version = "10.1.1.1";
      addonId = "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4455681/traduzir_paginas_web-10.1.1.1.xpi";
      sha256 = "dc94a7efac63468f7d34a74bedf5c8b360a67c99d213bb5b1a1d55d911797782";
      meta = with lib;
      {
        description = "Translate your page in real time using Google, Bing or Yandex.\nIt is not necessary to open new tabs.";
        license = licenses.mpl20;
        mozPermissions = [
          "<all_urls>"
          "storage"
          "activeTab"
          "contextMenus"
          "webRequest"
          "https://www.deepl.com/*/translator*"
        ];
        platforms = platforms.all;
      };
    };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.68.0";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/4629131/ublock_origin-1.68.0.xpi";
      sha256 = "5caf4abda494018841222a12156919bbdd8cad82a783c38c36b22dd642704315";
      meta = with lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        mozPermissions = [
          "alarms"
          "dns"
          "menus"
          "privacy"
          "storage"
          "tabs"
          "unlimitedStorage"
          "webNavigation"
          "webRequest"
          "webRequestBlocking"
          "<all_urls>"
          "http://*/*"
          "https://*/*"
          "file://*/*"
          "https://easylist.to/*"
          "https://*.fanboy.co.nz/*"
          "https://filterlists.com/*"
          "https://forums.lanik.us/*"
          "https://github.com/*"
          "https://*.github.io/*"
          "https://github.com/uBlockOrigin/*"
          "https://ublockorigin.github.io/*"
          "https://*.reddit.com/r/uBlockOrigin/*"
        ];
        platforms = platforms.all;
      };
    };
    "youtube-addon" = buildFirefoxXpiAddon {
      pname = "youtube-addon";
      version = "4.1400";
      addonId = "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4636627/youtube_addon-4.1400.xpi";
      sha256 = "f47e6df9018b7d78977b79a789a4dcdefbd6a0470f4c6c65cc4c5e50cb543543";
      meta = with lib;
      {
        homepage = "https://github.com/code4charity/YouTube-Extension/";
        description = "Youtube Extension. Powerful but lightweight. Enrich your Youtube and content selection. Make YouTube tidy and smart! (Layout, Filters, Shortcuts, Playlist)";
        mozPermissions = [
          "contextMenus"
          "storage"
          "https://www.youtube.com/*"
          "https://m.youtube.com/*"
        ];
        platforms = platforms.all;
      };
    };
  }

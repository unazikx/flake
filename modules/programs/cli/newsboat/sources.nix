let
  mk = url: tags: {
    url = "https://" + url;
    inherit
      tags
      ;
  };
in

[
  (mk "nixos.org/blog/announcements-rss.xml" [
    "linux"
    "nixos"
  ])

  (mk "weekly.nixos.org/feeds/all.rss.xml" [
    "linux"
    "nixos"
  ])

  (mk "redlib.thebunny.zone/r/ObsidianMD.rss" [
    "reddit"
  ])

  (mk "terminaltrove.com/new.xml" [
    "linux"
    "tech"
  ])

  (mk "terminaltrove.com/blog.xml" [
    "linux"
    "tech"
  ])

  (mk "lobste.rs/t/nix.rss" [
    "nixos"
    "tech"
  ])

  (mk "lobste.rs/rss" [
    "nixos"
    "tech"
  ])

  (mk "nyaa.iss.one/?page=rss" [
    "anime"
  ])

  (mk "readcomicsonline.ru/feed" [
    "manga"
    "comics"
    "geek"
  ])

  (mk "hytracker.net/rss.xml" [
    "games"
  ])
]
++ (map
  (
    id:
    (mk "www.youtube.com/feeds/videos.xml?channel_id=${id}" [
      "youtube"
    ])
  )
  [
    "UCB7ukMxILsqKU9SEzH7tvHg" # @NiksZakvielClips
  ]
)

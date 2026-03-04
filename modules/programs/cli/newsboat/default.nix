# INFO:
# rss feed reader
# for youtube feeds use pkg yt-id

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          hmPackages = [ pkgs.own.yt-id ];

          hm.programs.newsboat = {
            enable = true;

            autoReload = true;
            reloadTime = 5;

            urls = import ./sources.nix;

            extraConfig = ''
              color article            default   default
              color background         default   default
              color info               default   black
              color listfocus          black     cyan
              color listfocus_unread   black     cyan
              color listnormal         default   default
              color listnormal_unread  default   default

              unbind-key ENTER
              unbind-key j
              unbind-key k
              unbind-key J
              unbind-key K

              bind-key   j down
              bind-key   k up
              bind-key   l open
              bind-key   h quit

              bind-key   g home
              bind-key   G end

              bind-key   b bookmark

              bind-key . pagedown
              bind-key , pageup
            '';
          };
        };
    };
}

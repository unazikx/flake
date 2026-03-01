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
        let
          disable.enable = false;
          turnOff = list: lib.genAttrs list (_: lib.mkDefault disable);
        in
        {
          system = {
            disableInstallerTools = true;
            tools.nixos-rebuild.enable = true;
          };

          programs = turnOff [
            "nano"
            "command-not-found"
          ];

          environment = {
            defaultPackages = lib.mkForce [ ];
            systemPackages = with pkgs; [
              uutils-coreutils-noprefix
              uutils-findutils
              uutils-diffutils
            ];
          };

          documentation = turnOff [
            "dev"
            "doc"
            "info"
            "man"
            "nixos"
          ];

          hm = {
            news.display = "silent";

            programs.man = disable;

            manual = turnOff [
              "html"
              "json"
              "manpages"
            ];
          };

          systemd.generators.systemd-ssh-generator = "/dev/null";
          systemd.sockets.sshd-unix-local.enable = lib.mkForce false;
          systemd.sockets.sshd-vsock.enable = lib.mkForce false;
        };
    };
}

# INFO:
# 1) ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt
#    # WARN: check your ~/.config/sops/age/keys.txt
# 2) age-keygen -y ~/.config/sops/age/keys.txt
#    ssh-to-age < ~/.ssh/id_ed25519.pub
#    # WARN: will gives you same result

{
  ...
}:

{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      make-shells.secrets = {
        shellHook = ''
          if command -v fish > /dev/null 2>&1; then
            exec fish
          fi
        '';

        packages = [
          # keep-sorted start
          pkgs.age
          pkgs.sops
          pkgs.ssh-to-age
          # keep-sorted end
        ];
      };
    };
}

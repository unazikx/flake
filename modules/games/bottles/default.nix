# INFO:
# bullshit
# yeah

# goatse it just bottle
/*
   /     \             \            /    \
  |       |             \          |      |
  |       `.             |         |       :
  `        |             |        \|       |
   \       | /       /  \\\   --__ \\       :
    \      \/   _--~~          ~--__| \     |
     \      \_-~                    ~-_\    |
      \_     \                   ______\|   |
        \     \______           (_(__>  \   |
         \   .  C ___)         (_(____>  |  /
         /\ |   C ____)         (_____>  |_/
        / /\|   C_____)          (___>   /  \
       |   (   _C_____)             _/ /     \
       |    \  |__                 (__/       |
      | \    \____)                           |
      |  \_          ___\       /_          _/ |
     |              /    |     |  \            |
     |             |    /       \  \           |
     |          / /    |         |  \           |
     |         / /      \__/\___/    |          |
    |           /        |    |       |         |
    |          |         |    |       |         |
                      _.--------.
                     // _ ___ _
                        ______
                       /      \
                              |
                       \______/  //
                     \\_________//
                      `----   --'
*/

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
          persist.user.directories = [
            ".local/share/bottles"
          ];

          hmPackages = [
            (pkgs.bottles.override {
              removeWarningPopup = true;
            })
          ];
        };
    };
}

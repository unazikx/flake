{
  workspaces = import ./workspaces.nix {
    ws = app_id: { inherit app_id; };
  };

  float = import ./float.nix {
    float = {
      class = class: { inherit class; };
      title = title: { inherit title; };
    };
  };

  allOver = import ./allOver.nix rec {
    allOver = {
      mk = is: rule: command: {
        inherit command;
        criteria = {
          ${is} = rule;
        };
      };

      appid = allOver.mk "app_id";
      title = allOver.mk "title";
    };
  };
}

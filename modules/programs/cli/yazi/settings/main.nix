{
  lib,
  config,
  ...
}:
let
  mk =
    run: list:
    (map (mime: {
      inherit
        run
        mime
        ;
    }) list);

  office = (
    mk "office" [
      "application/ms-*"
      "application/msword"
      "application/oasis.*"
      "application/openxmlformats-officedocument.*"
    ]
  );
in

{
  shellWrapperName = "yy";

  settings = {
    mgr = {
      ratio = [
        1
        3
        4
      ];

      show_hidden = false;
      sort_by = "natural";
      sort_dir_first = true;
      sort_reverse = false;
      linemode = "size";
      show_symlink = true;
    };

    preview = {
      wrap = "yes";
      tab_size = 1;
      image_filter = "lanczos3";
      image_quality = 90;
      max_height = 5000;
      max_width = 5000;
    };

    input = lib.genAttrs [
      "cd_origin"
      "find_origin"
      "rename_origin"
      "filter_origin"
      "create_origin"
      "delete_origin"
      "search_origin"
      "shell_origin"
    ] (n: "center");

    plugin = {
      prepend_previewers =
        (mk "ouch" [
          "application/*zip"
          "application/*tar"
          "application/*bzip2"
          "application/*7z-compressed"
          "application/*rar"
          "application/*xz"
          "application/vnd.rar"
          "application/7z-compressed"
          "application/rar"
        ])
        ++ office
        ++ [
          {
            url = "*.md";
            run = "glow";
          }
        ];

      preloaders = office ++ [ ];

      prepend_fetchers = [
        {
          id = "git";
          url = "*";
          run = "git";
        }
        {
          id = "git";
          url = "*/";
          run = "git";
        }
      ];
    };

    opener = import ./opener.nix {
      inherit
        lib
        config
        ;
    };

    open = import ./open.nix {
      inherit
        lib
        ;
    };

    tasks = {
      image_bound = [
        0
        0
      ];
    };
  };
}

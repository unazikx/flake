{
  ...
}:

{
  zen.programs.cli.yazi.icons = {
    homeManager =
      {
        config,
        ...
      }:
      {
        programs.yazi.theme.icon =
          let
            colors = config.lib.stylix.colors.withHashtag;
          in
          {
            exts = [
              {
                name = "3gp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "3mf";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "7z";
                text = "";
                fg = colors.base08;
              }
              {
                name = "a";
                text = "";
                fg = colors.base06;
              }
              {
                name = "aac";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "ada";
                text = "";
                fg = colors.base06;
              }
              {
                name = "adb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ads";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ai";
                text = "";
                fg = colors.base06;
              }
              {
                name = "aif";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "aiff";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "android";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ape";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "apk";
                text = "";
                fg = colors.base06;
              }
              {
                name = "apl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "app";
                text = "";
                fg = colors.base06;
              }
              {
                name = "applescript";
                text = "";
                fg = colors.base06;
              }
              {
                name = "asc";
                text = "󰦝";
                fg = colors.base06;
              }
              {
                name = "asm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ass";
                text = "󰨖";
                fg = colors.base06;
              }
              {
                name = "astro";
                text = "";
                fg = colors.base06;
              }
              {
                name = "avif";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "awk";
                text = "";
                fg = colors.base06;
              }
              {
                name = "azcli";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bak";
                text = "󰁯";
                fg = colors.base06;
              }
              {
                name = "bash";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "bat";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bazel";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bib";
                text = "󱉟";
                fg = colors.base06;
              }
              {
                name = "bicep";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bicepparam";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bin";
                text = "";
                fg = colors.base06;
              }
              {
                name = "blade.php";
                text = "";
                fg = colors.base06;
              }
              {
                name = "blend";
                text = "󰂫";
                fg = colors.base06;
              }
              {
                name = "blp";
                text = "󰺾";
                fg = colors.base06;
              }
              {
                name = "bmp";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "bqn";
                text = "";
                fg = colors.base06;
              }
              {
                name = "brep";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "bz";
                text = "";
                fg = colors.base08;
              }
              {
                name = "bz2";
                text = "";
                fg = colors.base08;
              }
              {
                name = "bz3";
                text = "";
                fg = colors.base08;
              }
              {
                name = "bzl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "c";
                text = "";
                fg = colors.base06;
              }
              {
                name = "c++";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cache";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cast";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "cbl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ccm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cfc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cfg";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cfm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "clj";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cljc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cljd";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cljs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cmake";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cob";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cobol";
                text = "";
                fg = colors.base06;
              }
              {
                name = "coffee";
                text = "";
                fg = colors.base06;
              }
              {
                name = "conda";
                text = "";
                fg = colors.base06;
              }
              {
                name = "conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "config.ru";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cow";
                text = "󰆚";
                fg = colors.base06;
              }
              {
                name = "cp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cpp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cppm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cpy";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cr";
                text = "";
                fg = colors.base06;
              }
              {
                name = "crdownload";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cs";
                text = "󰌛";
                fg = colors.base06;
              }
              {
                name = "csh";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "cshtml";
                text = "󱦗";
                fg = colors.base06;
              }
              {
                name = "cson";
                text = "";
                fg = colors.base06;
              }
              {
                name = "csproj";
                text = "󰪮";
                fg = colors.base06;
              }
              {
                name = "css";
                text = "";
                fg = colors.base06;
              }
              {
                name = "csv";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cu";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cue";
                text = "󰲹";
                fg = colors.base06;
              }
              {
                name = "cuh";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cxx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cxxm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "d";
                text = "";
                fg = colors.base06;
              }
              {
                name = "d.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "dart";
                text = "";
                fg = colors.base06;
              }
              {
                name = "db";
                text = "";
                fg = colors.base06;
              }
              {
                name = "dconf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "desktop";
                text = "";
                fg = colors.base06;
              }
              {
                name = "diff";
                text = "";
                fg = colors.base06;
              }
              {
                name = "dll";
                text = "";
                fg = colors.base06;
              }
              {
                name = "doc";
                text = "󰈬";
                fg = colors.base06;
              }
              {
                name = "Dockerfile";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "dockerignore";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "docx";
                text = "󰈬";
                fg = colors.base06;
              }
              {
                name = "dot";
                text = "󱁉";
                fg = colors.base06;
              }
              {
                name = "download";
                text = "";
                dim = true;
                fg = colors.base06;
              }
              {
                name = "drl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "dropbox";
                text = "";
                fg = colors.base06;
              }
              {
                name = "dump";
                text = "";
                fg = colors.base06;
              }
              {
                name = "dwg";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "dxf";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "ebook";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ebuild";
                text = "";
                fg = colors.base06;
              }
              {
                name = "edn";
                text = "";
                fg = colors.base06;
              }
              {
                name = "eex";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ejs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "el";
                text = "";
                fg = colors.base06;
              }
              {
                name = "elc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "elf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "elm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "eln";
                text = "";
                fg = colors.base06;
              }
              {
                name = "env";
                text = "";
                fg = colors.base06;
              }
              {
                name = "eot";
                text = "";
                fg = colors.base06;
              }
              {
                name = "epp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "epub";
                text = "";
                fg = colors.base06;
              }
              {
                name = "erb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "erl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ex";
                text = "";
                fg = colors.base06;
              }
              {
                name = "exe";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "exs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "f#";
                text = "";
                fg = colors.base06;
              }
              {
                name = "f3d";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "f90";
                text = "󱈚";
                fg = colors.base06;
              }
              {
                name = "fbx";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "fcbak";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fcmacro";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fcmat";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fcparam";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fcscript";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fcstd";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fcstd1";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fctb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fctl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fdmdownload";
                text = "";
                fg = colors.base06;
              }
              {
                name = "feature";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fish";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "flac";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "flc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "flf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fnl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fodg";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fodp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fods";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fodt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "frag";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fsi";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fsscript";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gcode";
                text = "󰐫";
                fg = colors.base06;
              }
              {
                name = "gd";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gemspec";
                text = "";
                fg = colors.base06;
              }
              {
                name = "geom";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gif";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "git";
                text = "";
                fg = colors.base06;
              }
              {
                name = "glb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gleam";
                text = "";
                fg = colors.base06;
              }
              {
                name = "glsl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gnumakefile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "go";
                text = "";
                fg = colors.base06;
              }
              {
                name = "godot";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gpr";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gql";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gradle";
                text = "";
                fg = colors.base06;
              }
              {
                name = "graphql";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gresource";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gv";
                text = "󱁉";
                fg = colors.base06;
              }
              {
                name = "gz";
                text = "";
                fg = colors.base08;
              }
              {
                name = "h";
                text = "";
                fg = colors.base06;
              }
              {
                name = "haml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hbs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "heex";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hex";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hh";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hpp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hrl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "htm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "html";
                text = "";
                fg = colors.base06;
              }
              {
                name = "http";
                text = "";
                fg = colors.base06;
              }
              {
                name = "huff";
                text = "󰡘";
                fg = colors.base06;
              }
              {
                name = "hurl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hxx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ical";
                text = "";
                fg = colors.base06;
              }
              {
                name = "icalendar";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ico";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "ics";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ifb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ifc";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "ige";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "iges";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "igs";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "image";
                text = "";
                fg = colors.base06;
              }
              {
                name = "img";
                text = "";
                fg = colors.base06;
              }
              {
                name = "import";
                text = "";
                fg = colors.base06;
              }
              {
                name = "info";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ini";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ino";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ipynb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "iso";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ixx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jar";
                text = "";
                fg = colors.base06;
              }
              {
                name = "java";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jpeg";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "jpg";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "json";
                text = "";
                fg = colors.base06;
              }
              {
                name = "json5";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jsonc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jwmrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "jxl";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "kbx";
                text = "󰯄";
                fg = colors.base06;
              }
              {
                name = "kdb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kdbx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kdenlive";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kdenlivetitle";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_dru";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_mod";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_pcb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_prl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_pro";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_sch";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_sym";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kicad_wks";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ko";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kpp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kra";
                text = "";
                fg = colors.base06;
              }
              {
                name = "krz";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ksh";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "kt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "lck";
                text = "";
                fg = colors.base06;
              }
              {
                name = "leex";
                text = "";
                fg = colors.base06;
              }
              {
                name = "less";
                text = "";
                fg = colors.base06;
              }
              {
                name = "lff";
                text = "";
                fg = colors.base06;
              }
              {
                name = "lhs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "lib";
                text = "";
                fg = colors.base06;
              }
              {
                name = "license";
                text = "";
                fg = colors.base06;
              }
              {
                name = "liquid";
                text = "";
                fg = colors.base06;
              }
              {
                name = "lock";
                text = "";
                fg = colors.base06;
              }
              {
                name = "log";
                text = "󰌱";
                fg = colors.base06;
              }
              {
                name = "lrc";
                text = "󰨖";
                fg = colors.base06;
              }
              {
                name = "lua";
                text = "";
                fg = colors.base06;
              }
              {
                name = "luac";
                text = "";
                fg = colors.base06;
              }
              {
                name = "luau";
                text = "";
                fg = colors.base06;
              }
              {
                name = "m";
                text = "";
                fg = colors.base06;
              }
              {
                name = "m3u";
                text = "󰲹";
                fg = colors.base06;
              }
              {
                name = "m3u8";
                text = "󰲹";
                fg = colors.base06;
              }
              {
                name = "m4a";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "m4v";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "magnet";
                text = "";
                fg = colors.base06;
              }
              {
                name = "makefile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "markdown";
                text = "";
                fg = colors.base06;
              }
              {
                name = "material";
                text = "";
                fg = colors.base06;
              }
              {
                name = "md";
                text = "";
                fg = colors.base09;
              }
              {
                name = "md5";
                text = "󰕥";
                fg = colors.base06;
              }
              {
                name = "mdx";
                text = "";
                fg = colors.base09;
              }
              {
                name = "mint";
                text = "󰌪";
                fg = colors.base06;
              }
              {
                name = "mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mk";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mkv";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "ml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mli";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mo";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mobi";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mojo";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mov";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "mp3";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "mp4";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "mpp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "msf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mustache";
                text = "";
                fg = colors.base06;
              }
              {
                name = "nfo";
                text = "";
                fg = colors.base06;
              }
              {
                name = "nim";
                text = "";
                fg = colors.base06;
              }
              {
                name = "nix";
                text = "";
                fg = colors.base0D;
              }
              {
                name = "norg";
                text = "";
                fg = colors.base06;
              }
              {
                name = "nswag";
                text = "";
                fg = colors.base06;
              }
              {
                name = "nu";
                text = "";
                fg = colors.base06;
              }
              {
                name = "o";
                text = "";
                fg = colors.base06;
              }
              {
                name = "obj";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "odf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "odg";
                text = "";
                fg = colors.base06;
              }
              {
                name = "odin";
                text = "󰟢";
                fg = colors.base06;
              }
              {
                name = "odp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ods";
                text = "";
                fg = colors.base06;
              }
              {
                name = "odt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "oga";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "ogg";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "ogv";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "ogx";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "opus";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "org";
                text = "";
                fg = colors.base06;
              }
              {
                name = "otf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "out";
                text = "";
                fg = colors.base06;
              }
              {
                name = "part";
                text = "";
                fg = colors.base06;
              }
              {
                name = "patch";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pck";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pcm";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pdf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "php";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pls";
                text = "󰲹";
                fg = colors.base06;
              }
              {
                name = "ply";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "pm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "png";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "po";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pot";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pp";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ppt";
                text = "󰈧";
                fg = colors.base06;
              }
              {
                name = "pptx";
                text = "󰈧";
                fg = colors.base06;
              }
              {
                name = "prisma";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pro";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ps1";
                text = "󰨊";
                fg = colors.base06;
              }
              {
                name = "psb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "psd";
                text = "";
                fg = colors.base06;
              }
              {
                name = "psd1";
                text = "󰨊";
                fg = colors.base06;
              }
              {
                name = "psm1";
                text = "󰨊";
                fg = colors.base06;
              }
              {
                name = "pub";
                text = "󰷖";
                fg = colors.base06;
              }
              {
                name = "pxd";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pxi";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "py";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pyc";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pyd";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pyi";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pyo";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pyw";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "pyx";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "qm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "qml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "qrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "qss";
                text = "";
                fg = colors.base06;
              }
              {
                name = "query";
                text = "";
                fg = colors.base06;
              }
              {
                name = "R";
                text = "󰟔";
                fg = colors.base06;
              }
              {
                name = "r";
                text = "󰟔";
                fg = colors.base06;
              }
              {
                name = "rake";
                text = "";
                fg = colors.base06;
              }
              {
                name = "rar";
                text = "";
                fg = colors.base08;
              }
              {
                name = "rasi";
                text = "";
                fg = colors.base06;
              }
              {
                name = "razor";
                text = "󱦘";
                fg = colors.base06;
              }
              {
                name = "rb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "res";
                text = "";
                fg = colors.base06;
              }
              {
                name = "resi";
                text = "";
                fg = colors.base06;
              }
              {
                name = "rlib";
                text = "";
                fg = colors.base06;
              }
              {
                name = "rmd";
                text = "";
                fg = colors.base06;
              }
              {
                name = "rproj";
                text = "󰗆";
                fg = colors.base06;
              }
              {
                name = "rs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "rss";
                text = "";
                fg = colors.base06;
              }
              {
                name = "s";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sass";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sbt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "scad";
                text = "";
                fg = colors.base06;
              }
              {
                name = "scala";
                text = "";
                fg = colors.base06;
              }
              {
                name = "scm";
                text = "󰘧";
                fg = colors.base06;
              }
              {
                name = "scss";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sh";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "sha1";
                text = "󰕥";
                fg = colors.base06;
              }
              {
                name = "sha224";
                text = "󰕥";
                fg = colors.base06;
              }
              {
                name = "sha256";
                text = "󰕥";
                fg = colors.base06;
              }
              {
                name = "sha384";
                text = "󰕥";
                fg = colors.base06;
              }
              {
                name = "sha512";
                text = "󰕥";
                fg = colors.base06;
              }
              {
                name = "sig";
                text = "󰘧";
                fg = colors.base06;
              }
              {
                name = "signature";
                text = "󰘧";
                fg = colors.base06;
              }
              {
                name = "skp";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "sldasm";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "sldprt";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "slim";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sln";
                text = "";
                fg = colors.base06;
              }
              {
                name = "slnx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "slvs";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "sml";
                text = "󰘧";
                fg = colors.base06;
              }
              {
                name = "so";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sol";
                text = "";
                fg = colors.base06;
              }
              {
                name = "spec.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "spec.jsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "spec.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "spec.tsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "spx";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "sql";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sqlite";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sqlite3";
                text = "";
                fg = colors.base06;
              }
              {
                name = "srt";
                text = "󰨖";
                fg = colors.base06;
              }
              {
                name = "ssa";
                text = "󰨖";
                fg = colors.base06;
              }
              {
                name = "ste";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "step";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "stl";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "stories.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stories.jsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stories.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stories.svelte";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stories.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stories.tsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stories.vue";
                text = "";
                fg = colors.base06;
              }
              {
                name = "stp";
                text = "󰻫";
                fg = colors.base06;
              }
              {
                name = "strings";
                text = "";
                fg = colors.base06;
              }
              {
                name = "styl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sub";
                text = "󰨖";
                fg = colors.base06;
              }
              {
                name = "sublime";
                text = "";
                fg = colors.base06;
              }
              {
                name = "suo";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sv";
                text = "󰍛";
                fg = colors.base06;
              }
              {
                name = "svelte";
                text = "";
                fg = colors.base06;
              }
              {
                name = "svg";
                text = "󰜡";
                fg = colors.base06;
              }
              {
                name = "svgz";
                text = "󰜡";
                fg = colors.base06;
              }
              {
                name = "svh";
                text = "󰍛";
                fg = colors.base06;
              }
              {
                name = "swift";
                text = "";
                fg = colors.base06;
              }
              {
                name = "t";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tbc";
                text = "󰛓";
                fg = colors.base06;
              }
              {
                name = "tcl";
                text = "󰛓";
                fg = colors.base06;
              }
              {
                name = "templ";
                text = "";
                fg = colors.base06;
              }
              {
                name = "terminal";
                text = "";
                fg = colors.base06;
              }
              {
                name = "test.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "test.jsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "test.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "test.tsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tex";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tfvars";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tgz";
                text = "";
                fg = colors.base08;
              }
              {
                name = "tmpl";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tmux";
                text = "";
                fg = colors.base06;
              }
              {
                name = "toml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "torrent";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tres";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tscn";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tsconfig";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tsx";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ttf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "twig";
                text = "";
                fg = colors.base06;
              }
              {
                name = "txt";
                text = "󰈙";
                fg = colors.base06;
              }
              {
                name = "txz";
                text = "";
                fg = colors.base08;
              }
              {
                name = "typ";
                text = "";
                fg = colors.base06;
              }
              {
                name = "typoscript";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ui";
                text = "";
                fg = colors.base06;
              }
              {
                name = "v";
                text = "󰍛";
                fg = colors.base06;
              }
              {
                name = "vala";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vert";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vh";
                text = "󰍛";
                fg = colors.base06;
              }
              {
                name = "vhd";
                text = "󰍛";
                fg = colors.base06;
              }
              {
                name = "vhdl";
                text = "󰍛";
                fg = colors.base06;
              }
              {
                name = "vi";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vim";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vsh";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vsix";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vue";
                text = "";
                fg = colors.base06;
              }
              {
                name = "wasm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "wav";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "webm";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "webmanifest";
                text = "";
                fg = colors.base06;
              }
              {
                name = "webp";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "webpack";
                text = "󰜫";
                fg = colors.base06;
              }
              {
                name = "wma";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "wmv";
                text = "";
                fg = colors.base0E;
              }
              {
                name = "woff";
                text = "";
                fg = colors.base06;
              }
              {
                name = "woff2";
                text = "";
                fg = colors.base06;
              }
              {
                name = "wrl";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "wrz";
                text = "󰆧";
                fg = colors.base06;
              }
              {
                name = "wv";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "wvc";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "x";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xaml";
                text = "󰙳";
                fg = colors.base06;
              }
              {
                name = "xcf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xcplayground";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xcstrings";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xls";
                text = "󰈛";
                fg = colors.base06;
              }
              {
                name = "xlsx";
                text = "󰈛";
                fg = colors.base06;
              }
              {
                name = "xm";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xml";
                text = "󰗀";
                fg = colors.base06;
              }
              {
                name = "xpi";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xslt";
                text = "󰗀";
                fg = colors.base06;
              }
              {
                name = "xul";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xz";
                text = "";
                fg = colors.base08;
              }
              {
                name = "yaml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "yml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "zig";
                text = "";
                fg = colors.base06;
              }
              {
                name = "zip";
                text = "";
                fg = colors.base08;
              }
              {
                name = "zsh";
                text = "";
                fg = colors.base0B;
              }
              {
                name = "zst";
                text = "";
                fg = colors.base08;
              }
              {
                name = "🔥";
                text = "";
                fg = colors.base06;
              }
            ];

            files = [
              {
                name = ".babelrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".bash_profile";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".bashrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".clang-format";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".clang-tidy";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".codespellrc";
                text = "󰓆";
                fg = colors.base06;
              }
              {
                name = ".condarc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".dockerignore";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = ".ds_store";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".editorconfig";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".env";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".eslintignore";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".eslintrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".git-blame-ignore-revs";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gitattributes";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gitconfig";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gitignore";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gitlab-ci.yml";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gitmodules";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gtkrc-2.0";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".gvimrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".justfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".luacheckrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".luaurc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".mailmap";
                text = "󰊢";
                fg = colors.base06;
              }
              {
                name = ".nanorc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".npmignore";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".npmrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".nuxtrc";
                text = "󱄆";
                fg = colors.base06;
              }
              {
                name = ".nvmrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".pnpmfile.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".pre-commit-config.yaml";
                text = "󰛢";
                fg = colors.base06;
              }
              {
                name = ".prettierignore";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.json5";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.toml";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.yaml";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".prettierrc.yml";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".pylintrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".settings.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".SRCINFO";
                text = "󰣇";
                fg = colors.base06;
              }
              {
                name = ".vimrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".Xauthority";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".xinitrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".Xresources";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".xsession";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".zprofile";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".zshenv";
                text = "";
                fg = colors.base06;
              }
              {
                name = ".zshrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "_gvimrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "_vimrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "AUTHORS";
                text = "";
                fg = colors.base06;
              }
              {
                name = "AUTHORS.txt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "brewfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bspwmrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "build";
                text = "";
                fg = colors.base06;
              }
              {
                name = "build.gradle";
                text = "";
                fg = colors.base06;
              }
              {
                name = "build.zig.zon";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bun.lock";
                text = "";
                fg = colors.base06;
              }
              {
                name = "bun.lockb";
                text = "";
                fg = colors.base06;
              }
              {
                name = "cantorrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "checkhealth";
                text = "󰓙";
                fg = colors.base06;
              }
              {
                name = "cmakelists.txt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "code_of_conduct";
                text = "";
                fg = colors.base06;
              }
              {
                name = "code_of_conduct.md";
                text = "";
                fg = colors.base09;
              }
              {
                name = "commit_editmsg";
                text = "";
                fg = colors.base06;
              }
              {
                name = "commitlint.config.js";
                text = "󰜘";
                fg = colors.base06;
              }
              {
                name = "commitlint.config.ts";
                text = "󰜘";
                fg = colors.base06;
              }
              {
                name = "compose.yaml";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "compose.yml";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "config";
                text = "";
                fg = colors.base06;
              }
              {
                name = "containerfile";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "copying";
                text = "";
                fg = colors.base06;
              }
              {
                name = "copying.lesser";
                text = "";
                fg = colors.base06;
              }
              {
                name = "Directory.Build.props";
                text = "";
                fg = colors.base06;
              }
              {
                name = "Directory.Build.targets";
                text = "";
                fg = colors.base06;
              }
              {
                name = "Directory.Packages.props";
                text = "";
                fg = colors.base06;
              }
              {
                name = "docker-compose.yaml";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "docker-compose.yml";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "dockerfile";
                text = "󰡨";
                fg = colors.base06;
              }
              {
                name = "eslint.config.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "eslint.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "eslint.config.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "eslint.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ext_typoscript_setup.txt";
                text = "";
                fg = colors.base06;
              }
              {
                name = "favicon.ico";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fp-info-cache";
                text = "";
                fg = colors.base06;
              }
              {
                name = "fp-lib-table";
                text = "";
                fg = colors.base06;
              }
              {
                name = "FreeCAD.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "Gemfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gnumakefile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "go.mod";
                text = "";
                fg = colors.base06;
              }
              {
                name = "go.sum";
                text = "";
                fg = colors.base06;
              }
              {
                name = "go.work";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gradle-wrapper.properties";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gradle.properties";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gradlew";
                text = "";
                fg = colors.base06;
              }
              {
                name = "groovy";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gruntfile.babel.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gruntfile.coffee";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gruntfile.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gruntfile.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gtkrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gulpfile.babel.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gulpfile.coffee";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gulpfile.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "gulpfile.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hypridle.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hyprland.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hyprlandd.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hyprlock.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hyprpaper.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "hyprsunset.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "i18n.config.js";
                text = "󰗊";
                fg = colors.base06;
              }
              {
                name = "i18n.config.ts";
                text = "󰗊";
                fg = colors.base06;
              }
              {
                name = "i3blocks.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "i3status.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "index.theme";
                text = "";
                fg = colors.base06;
              }
              {
                name = "ionic.config.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = "Jenkinsfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "justfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kalgebrarc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kdeglobals";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kdenlive-layoutsrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kdenliverc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kritadisplayrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "kritarc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "license";
                text = "";
                fg = colors.base09;
              }
              {
                name = "license.md";
                text = "";
                fg = colors.base09;
              }
              {
                name = "lxde-rc.xml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "lxqt.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "makefile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mix.lock";
                text = "";
                fg = colors.base06;
              }
              {
                name = "mpv.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "next.config.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "next.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "next.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "node_modules";
                text = "";
                fg = colors.base06;
              }
              {
                name = "nuxt.config.cjs";
                text = "󱄆";
                fg = colors.base06;
              }
              {
                name = "nuxt.config.js";
                text = "󱄆";
                fg = colors.base06;
              }
              {
                name = "nuxt.config.mjs";
                text = "󱄆";
                fg = colors.base06;
              }
              {
                name = "nuxt.config.ts";
                text = "󱄆";
                fg = colors.base06;
              }
              {
                name = "package-lock.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = "package.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = "PKGBUILD";
                text = "";
                fg = colors.base06;
              }
              {
                name = "platformio.ini";
                text = "";
                fg = colors.base06;
              }
              {
                name = "playwright.config.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "playwright.config.cts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "playwright.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "playwright.config.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "playwright.config.mts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "playwright.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pnpm-lock.yaml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pnpm-workspace.yaml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "pom.xml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "prettier.config.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "prettier.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "prettier.config.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "prettier.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "prisma.config.mts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "prisma.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "procfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "PrusaSlicer.ini";
                text = "";
                fg = colors.base06;
              }
              {
                name = "PrusaSlicerGcodeViewer.ini";
                text = "";
                fg = colors.base06;
              }
              {
                name = "py.typed";
                text = "";
                fg = colors.base0A;
              }
              {
                name = "QtProject.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "rakefile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "readme";
                text = "󰂺";
                fg = colors.base06;
              }
              {
                name = "readme.md";
                text = "󰂺";
                fg = colors.base09;
              }
              {
                name = "rmd";
                text = "";
                fg = colors.base06;
              }
              {
                name = "robots.txt";
                text = "󰚩";
                fg = colors.base06;
              }
              {
                name = "security";
                text = "󰒃";
                fg = colors.base06;
              }
              {
                name = "security.md";
                text = "󰒃";
                fg = colors.base09;
              }
              {
                name = "settings.gradle";
                text = "";
                fg = colors.base06;
              }
              {
                name = "svelte.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sxhkdrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "sym-lib-table";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tailwind.config.js";
                text = "󱏿";
                fg = colors.base06;
              }
              {
                name = "tailwind.config.mjs";
                text = "󱏿";
                fg = colors.base06;
              }
              {
                name = "tailwind.config.ts";
                text = "󱏿";
                fg = colors.base06;
              }
              {
                name = "tmux.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tmux.conf.local";
                text = "";
                fg = colors.base06;
              }
              {
                name = "tsconfig.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = "unlicense";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vagrantfile";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vercel.json";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vite.config.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vite.config.cts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vite.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vite.config.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vite.config.mts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vite.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vitest.config.cjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vitest.config.cts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vitest.config.js";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vitest.config.mjs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vitest.config.mts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vitest.config.ts";
                text = "";
                fg = colors.base06;
              }
              {
                name = "vlcrc";
                text = "󰕼";
                fg = colors.base06;
              }
              {
                name = "webpack";
                text = "󰜫";
                fg = colors.base06;
              }
              {
                name = "weston.ini";
                text = "";
                fg = colors.base06;
              }
              {
                name = "workspace";
                text = "";
                fg = colors.base06;
              }
              {
                name = "wrangler.jsonc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "wrangler.toml";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xdph.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xmobarrc";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xmobarrc.hs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xmonad.hs";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xorg.conf";
                text = "";
                fg = colors.base06;
              }
              {
                name = "xsettingsd.conf";
                text = "";
                fg = colors.base06;
              }
            ];

            conds = [
              {
                "if" = "orphan";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "link";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "block";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "char";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "fifo";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "sock";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "sticky";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "dummy";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "dir";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "exec";
                text = "";
                fg = colors.base06;
              }
              {
                "if" = "!dir";
                text = "";
                fg = colors.base06;
              }
            ];

            dirs = [
              {
                name = ".config";
                text = "";
                fg = colors.base0F;
              }
              {
                name = ".git";
                text = "";
                fg = colors.base0F;
              }
              {
                name = ".github";
                text = "";
                fg = colors.base0F;
              }
              {
                name = ".npm";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Desktop";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Development";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Documents";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Downloads";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Library";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Movies";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Music";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Pictures";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Public";
                text = "";
                fg = colors.base0F;
              }
              {
                name = "Videos";
                text = "";
                fg = colors.base0F;
              }
            ];
          };
      };
  };
}

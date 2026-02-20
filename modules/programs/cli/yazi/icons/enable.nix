{
  lib,
  fg,
}:

{
  off = lib.genAttrs [
    "globs"
    "dirs"
    "files"
    "exts"
    "conds"
  ] (n: [ ]);
  on = {
    exts = [
      {
        name = "3gp";
        text = "";
        inherit fg;
      }
      {
        name = "3mf";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "7z";
        text = "";
        inherit fg;
      }
      {
        name = "a";
        text = "";
        inherit fg;
      }
      {
        name = "aac";
        text = "";
        inherit fg;
      }
      {
        name = "ada";
        text = "";
        inherit fg;
      }
      {
        name = "adb";
        text = "";
        inherit fg;
      }
      {
        name = "ads";
        text = "";
        inherit fg;
      }
      {
        name = "ai";
        text = "";
        inherit fg;
      }
      {
        name = "aif";
        text = "";
        inherit fg;
      }
      {
        name = "aiff";
        text = "";
        inherit fg;
      }
      {
        name = "android";
        text = "";
        inherit fg;
      }
      {
        name = "ape";
        text = "";
        inherit fg;
      }
      {
        name = "apk";
        text = "";
        inherit fg;
      }
      {
        name = "apl";
        text = "";
        inherit fg;
      }
      {
        name = "app";
        text = "";
        inherit fg;
      }
      {
        name = "applescript";
        text = "";
        inherit fg;
      }
      {
        name = "asc";
        text = "󰦝";
        inherit fg;
      }
      {
        name = "asm";
        text = "";
        inherit fg;
      }
      {
        name = "ass";
        text = "󰨖";
        inherit fg;
      }
      {
        name = "astro";
        text = "";
        inherit fg;
      }
      {
        name = "avif";
        text = "";
        inherit fg;
      }
      {
        name = "awk";
        text = "";
        inherit fg;
      }
      {
        name = "azcli";
        text = "";
        inherit fg;
      }
      {
        name = "bak";
        text = "󰁯";
        inherit fg;
      }
      {
        name = "bash";
        text = "";
        inherit fg;
      }
      {
        name = "bat";
        text = "";
        inherit fg;
      }
      {
        name = "bazel";
        text = "";
        inherit fg;
      }
      {
        name = "bib";
        text = "󱉟";
        inherit fg;
      }
      {
        name = "bicep";
        text = "";
        inherit fg;
      }
      {
        name = "bicepparam";
        text = "";
        inherit fg;
      }
      {
        name = "bin";
        text = "";
        inherit fg;
      }
      {
        name = "blade.php";
        text = "";
        inherit fg;
      }
      {
        name = "blend";
        text = "󰂫";
        inherit fg;
      }
      {
        name = "blp";
        text = "󰺾";
        inherit fg;
      }
      {
        name = "bmp";
        text = "";
        inherit fg;
      }
      {
        name = "bqn";
        text = "";
        inherit fg;
      }
      {
        name = "brep";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "bz";
        text = "";
        inherit fg;
      }
      {
        name = "bz2";
        text = "";
        inherit fg;
      }
      {
        name = "bz3";
        text = "";
        inherit fg;
      }
      {
        name = "bzl";
        text = "";
        inherit fg;
      }
      {
        name = "c";
        text = "";
        inherit fg;
      }
      {
        name = "c++";
        text = "";
        inherit fg;
      }
      {
        name = "cache";
        text = "";
        inherit fg;
      }
      {
        name = "cast";
        text = "";
        inherit fg;
      }
      {
        name = "cbl";
        text = "";
        inherit fg;
      }
      {
        name = "cc";
        text = "";
        inherit fg;
      }
      {
        name = "ccm";
        text = "";
        inherit fg;
      }
      {
        name = "cfc";
        text = "";
        inherit fg;
      }
      {
        name = "cfg";
        text = "";
        inherit fg;
      }
      {
        name = "cfm";
        text = "";
        inherit fg;
      }
      {
        name = "cjs";
        text = "";
        inherit fg;
      }
      {
        name = "clj";
        text = "";
        inherit fg;
      }
      {
        name = "cljc";
        text = "";
        inherit fg;
      }
      {
        name = "cljd";
        text = "";
        inherit fg;
      }
      {
        name = "cljs";
        text = "";
        inherit fg;
      }
      {
        name = "cmake";
        text = "";
        inherit fg;
      }
      {
        name = "cob";
        text = "";
        inherit fg;
      }
      {
        name = "cobol";
        text = "";
        inherit fg;
      }
      {
        name = "coffee";
        text = "";
        inherit fg;
      }
      {
        name = "conda";
        text = "";
        inherit fg;
      }
      {
        name = "conf";
        text = "";
        inherit fg;
      }
      {
        name = "config.ru";
        text = "";
        inherit fg;
      }
      {
        name = "cow";
        text = "󰆚";
        inherit fg;
      }
      {
        name = "cp";
        text = "";
        inherit fg;
      }
      {
        name = "cpp";
        text = "";
        inherit fg;
      }
      {
        name = "cppm";
        text = "";
        inherit fg;
      }
      {
        name = "cpy";
        text = "";
        inherit fg;
      }
      {
        name = "cr";
        text = "";
        inherit fg;
      }
      {
        name = "crdownload";
        text = "";
        inherit fg;
      }
      {
        name = "cs";
        text = "󰌛";
        inherit fg;
      }
      {
        name = "csh";
        text = "";
        inherit fg;
      }
      {
        name = "cshtml";
        text = "󱦗";
        inherit fg;
      }
      {
        name = "cson";
        text = "";
        inherit fg;
      }
      {
        name = "csproj";
        text = "󰪮";
        inherit fg;
      }
      {
        name = "css";
        text = "";
        inherit fg;
      }
      {
        name = "csv";
        text = "";
        inherit fg;
      }
      {
        name = "cts";
        text = "";
        inherit fg;
      }
      {
        name = "cu";
        text = "";
        inherit fg;
      }
      {
        name = "cue";
        text = "󰲹";
        inherit fg;
      }
      {
        name = "cuh";
        text = "";
        inherit fg;
      }
      {
        name = "cxx";
        text = "";
        inherit fg;
      }
      {
        name = "cxxm";
        text = "";
        inherit fg;
      }
      {
        name = "d";
        text = "";
        inherit fg;
      }
      {
        name = "d.ts";
        text = "";
        inherit fg;
      }
      {
        name = "dart";
        text = "";
        inherit fg;
      }
      {
        name = "db";
        text = "";
        inherit fg;
      }
      {
        name = "dconf";
        text = "";
        inherit fg;
      }
      {
        name = "desktop";
        text = "";
        inherit fg;
      }
      {
        name = "diff";
        text = "";
        inherit fg;
      }
      {
        name = "dll";
        text = "";
        inherit fg;
      }
      {
        name = "doc";
        text = "󰈬";
        inherit fg;
      }
      {
        name = "Dockerfile";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "dockerignore";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "docx";
        text = "󰈬";
        inherit fg;
      }
      {
        name = "dot";
        text = "󱁉";
        inherit fg;
      }
      {
        name = "download";
        text = "";
        inherit fg;
      }
      {
        name = "drl";
        text = "";
        inherit fg;
      }
      {
        name = "dropbox";
        text = "";
        inherit fg;
      }
      {
        name = "dump";
        text = "";
        inherit fg;
      }
      {
        name = "dwg";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "dxf";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "ebook";
        text = "";
        inherit fg;
      }
      {
        name = "ebuild";
        text = "";
        inherit fg;
      }
      {
        name = "edn";
        text = "";
        inherit fg;
      }
      {
        name = "eex";
        text = "";
        inherit fg;
      }
      {
        name = "ejs";
        text = "";
        inherit fg;
      }
      {
        name = "el";
        text = "";
        inherit fg;
      }
      {
        name = "elc";
        text = "";
        inherit fg;
      }
      {
        name = "elf";
        text = "";
        inherit fg;
      }
      {
        name = "elm";
        text = "";
        inherit fg;
      }
      {
        name = "eln";
        text = "";
        inherit fg;
      }
      {
        name = "env";
        text = "";
        inherit fg;
      }
      {
        name = "eot";
        text = "";
        inherit fg;
      }
      {
        name = "epp";
        text = "";
        inherit fg;
      }
      {
        name = "epub";
        text = "";
        inherit fg;
      }
      {
        name = "erb";
        text = "";
        inherit fg;
      }
      {
        name = "erl";
        text = "";
        inherit fg;
      }
      {
        name = "ex";
        text = "";
        inherit fg;
      }
      {
        name = "exe";
        text = "";
        inherit fg;
      }
      {
        name = "exs";
        text = "";
        inherit fg;
      }
      {
        name = "f#";
        text = "";
        inherit fg;
      }
      {
        name = "f3d";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "f90";
        text = "󱈚";
        inherit fg;
      }
      {
        name = "fbx";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "fcbak";
        text = "";
        inherit fg;
      }
      {
        name = "fcmacro";
        text = "";
        inherit fg;
      }
      {
        name = "fcmat";
        text = "";
        inherit fg;
      }
      {
        name = "fcparam";
        text = "";
        inherit fg;
      }
      {
        name = "fcscript";
        text = "";
        inherit fg;
      }
      {
        name = "fcstd";
        text = "";
        inherit fg;
      }
      {
        name = "fcstd1";
        text = "";
        inherit fg;
      }
      {
        name = "fctb";
        text = "";
        inherit fg;
      }
      {
        name = "fctl";
        text = "";
        inherit fg;
      }
      {
        name = "fdmdownload";
        text = "";
        inherit fg;
      }
      {
        name = "feature";
        text = "";
        inherit fg;
      }
      {
        name = "fish";
        text = "";
        inherit fg;
      }
      {
        name = "flac";
        text = "";
        inherit fg;
      }
      {
        name = "flc";
        text = "";
        inherit fg;
      }
      {
        name = "flf";
        text = "";
        inherit fg;
      }
      {
        name = "fnl";
        text = "";
        inherit fg;
      }
      {
        name = "fodg";
        text = "";
        inherit fg;
      }
      {
        name = "fodp";
        text = "";
        inherit fg;
      }
      {
        name = "fods";
        text = "";
        inherit fg;
      }
      {
        name = "fodt";
        text = "";
        inherit fg;
      }
      {
        name = "frag";
        text = "";
        inherit fg;
      }
      {
        name = "fs";
        text = "";
        inherit fg;
      }
      {
        name = "fsi";
        text = "";
        inherit fg;
      }
      {
        name = "fsscript";
        text = "";
        inherit fg;
      }
      {
        name = "fsx";
        text = "";
        inherit fg;
      }
      {
        name = "gcode";
        text = "󰐫";
        inherit fg;
      }
      {
        name = "gd";
        text = "";
        inherit fg;
      }
      {
        name = "gemspec";
        text = "";
        inherit fg;
      }
      {
        name = "geom";
        text = "";
        inherit fg;
      }
      {
        name = "gif";
        text = "";
        inherit fg;
      }
      {
        name = "git";
        text = "";
        inherit fg;
      }
      {
        name = "glb";
        text = "";
        inherit fg;
      }
      {
        name = "gleam";
        text = "";
        inherit fg;
      }
      {
        name = "glsl";
        text = "";
        inherit fg;
      }
      {
        name = "gnumakefile";
        text = "";
        inherit fg;
      }
      {
        name = "go";
        text = "";
        inherit fg;
      }
      {
        name = "godot";
        text = "";
        inherit fg;
      }
      {
        name = "gpr";
        text = "";
        inherit fg;
      }
      {
        name = "gql";
        text = "";
        inherit fg;
      }
      {
        name = "gradle";
        text = "";
        inherit fg;
      }
      {
        name = "graphql";
        text = "";
        inherit fg;
      }
      {
        name = "gresource";
        text = "";
        inherit fg;
      }
      {
        name = "gv";
        text = "󱁉";
        inherit fg;
      }
      {
        name = "gz";
        text = "";
        inherit fg;
      }
      {
        name = "h";
        text = "";
        inherit fg;
      }
      {
        name = "haml";
        text = "";
        inherit fg;
      }
      {
        name = "hbs";
        text = "";
        inherit fg;
      }
      {
        name = "heex";
        text = "";
        inherit fg;
      }
      {
        name = "hex";
        text = "";
        inherit fg;
      }
      {
        name = "hh";
        text = "";
        inherit fg;
      }
      {
        name = "hpp";
        text = "";
        inherit fg;
      }
      {
        name = "hrl";
        text = "";
        inherit fg;
      }
      {
        name = "hs";
        text = "";
        inherit fg;
      }
      {
        name = "htm";
        text = "";
        inherit fg;
      }
      {
        name = "html";
        text = "";
        inherit fg;
      }
      {
        name = "http";
        text = "";
        inherit fg;
      }
      {
        name = "huff";
        text = "󰡘";
        inherit fg;
      }
      {
        name = "hurl";
        text = "";
        inherit fg;
      }
      {
        name = "hx";
        text = "";
        inherit fg;
      }
      {
        name = "hxx";
        text = "";
        inherit fg;
      }
      {
        name = "ical";
        text = "";
        inherit fg;
      }
      {
        name = "icalendar";
        text = "";
        inherit fg;
      }
      {
        name = "ico";
        text = "";
        inherit fg;
      }
      {
        name = "ics";
        text = "";
        inherit fg;
      }
      {
        name = "ifb";
        text = "";
        inherit fg;
      }
      {
        name = "ifc";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "ige";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "iges";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "igs";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "image";
        text = "";
        inherit fg;
      }
      {
        name = "img";
        text = "";
        inherit fg;
      }
      {
        name = "import";
        text = "";
        inherit fg;
      }
      {
        name = "info";
        text = "";
        inherit fg;
      }
      {
        name = "ini";
        text = "";
        inherit fg;
      }
      {
        name = "ino";
        text = "";
        inherit fg;
      }
      {
        name = "ipynb";
        text = "";
        inherit fg;
      }
      {
        name = "iso";
        text = "";
        inherit fg;
      }
      {
        name = "ixx";
        text = "";
        inherit fg;
      }
      {
        name = "jar";
        text = "";
        inherit fg;
      }
      {
        name = "java";
        text = "";
        inherit fg;
      }
      {
        name = "jl";
        text = "";
        inherit fg;
      }
      {
        name = "jpeg";
        text = "";
        inherit fg;
      }
      {
        name = "jpg";
        text = "";
        inherit fg;
      }
      {
        name = "js";
        text = "";
        inherit fg;
      }
      {
        name = "json";
        text = "";
        inherit fg;
      }
      {
        name = "json5";
        text = "";
        inherit fg;
      }
      {
        name = "jsonc";
        text = "";
        inherit fg;
      }
      {
        name = "jsx";
        text = "";
        inherit fg;
      }
      {
        name = "jwmrc";
        text = "";
        inherit fg;
      }
      {
        name = "jxl";
        text = "";
        inherit fg;
      }
      {
        name = "kbx";
        text = "󰯄";
        inherit fg;
      }
      {
        name = "kdb";
        text = "";
        inherit fg;
      }
      {
        name = "kdbx";
        text = "";
        inherit fg;
      }
      {
        name = "kdenlive";
        text = "";
        inherit fg;
      }
      {
        name = "kdenlivetitle";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_dru";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_mod";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_pcb";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_prl";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_pro";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_sch";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_sym";
        text = "";
        inherit fg;
      }
      {
        name = "kicad_wks";
        text = "";
        inherit fg;
      }
      {
        name = "ko";
        text = "";
        inherit fg;
      }
      {
        name = "kpp";
        text = "";
        inherit fg;
      }
      {
        name = "kra";
        text = "";
        inherit fg;
      }
      {
        name = "krz";
        text = "";
        inherit fg;
      }
      {
        name = "ksh";
        text = "";
        inherit fg;
      }
      {
        name = "kt";
        text = "";
        inherit fg;
      }
      {
        name = "kts";
        text = "";
        inherit fg;
      }
      {
        name = "lck";
        text = "";
        inherit fg;
      }
      {
        name = "leex";
        text = "";
        inherit fg;
      }
      {
        name = "less";
        text = "";
        inherit fg;
      }
      {
        name = "lff";
        text = "";
        inherit fg;
      }
      {
        name = "lhs";
        text = "";
        inherit fg;
      }
      {
        name = "lib";
        text = "";
        inherit fg;
      }
      {
        name = "license";
        text = "";
        inherit fg;
      }
      {
        name = "liquid";
        text = "";
        inherit fg;
      }
      {
        name = "lock";
        text = "";
        inherit fg;
      }
      {
        name = "log";
        text = "󰌱";
        inherit fg;
      }
      {
        name = "lrc";
        text = "󰨖";
        inherit fg;
      }
      {
        name = "lua";
        text = "";
        inherit fg;
      }
      {
        name = "luac";
        text = "";
        inherit fg;
      }
      {
        name = "luau";
        text = "";
        inherit fg;
      }
      {
        name = "m";
        text = "";
        inherit fg;
      }
      {
        name = "m3u";
        text = "󰲹";
        inherit fg;
      }
      {
        name = "m3u8";
        text = "󰲹";
        inherit fg;
      }
      {
        name = "m4a";
        text = "";
        inherit fg;
      }
      {
        name = "m4v";
        text = "";
        inherit fg;
      }
      {
        name = "magnet";
        text = "";
        inherit fg;
      }
      {
        name = "makefile";
        text = "";
        inherit fg;
      }
      {
        name = "markdown";
        text = "";
        inherit fg;
      }
      {
        name = "material";
        text = "";
        inherit fg;
      }
      {
        name = "md";
        text = "";
        inherit fg;
      }
      {
        name = "md5";
        text = "󰕥";
        inherit fg;
      }
      {
        name = "mdx";
        text = "";
        inherit fg;
      }
      {
        name = "mint";
        text = "󰌪";
        inherit fg;
      }
      {
        name = "mjs";
        text = "";
        inherit fg;
      }
      {
        name = "mk";
        text = "";
        inherit fg;
      }
      {
        name = "mkv";
        text = "";
        inherit fg;
      }
      {
        name = "ml";
        text = "";
        inherit fg;
      }
      {
        name = "mli";
        text = "";
        inherit fg;
      }
      {
        name = "mm";
        text = "";
        inherit fg;
      }
      {
        name = "mo";
        text = "";
        inherit fg;
      }
      {
        name = "mobi";
        text = "";
        inherit fg;
      }
      {
        name = "mojo";
        text = "";
        inherit fg;
      }
      {
        name = "mov";
        text = "";
        inherit fg;
      }
      {
        name = "mp3";
        text = "";
        inherit fg;
      }
      {
        name = "mp4";
        text = "";
        inherit fg;
      }
      {
        name = "mpp";
        text = "";
        inherit fg;
      }
      {
        name = "msf";
        text = "";
        inherit fg;
      }
      {
        name = "mts";
        text = "";
        inherit fg;
      }
      {
        name = "mustache";
        text = "";
        inherit fg;
      }
      {
        name = "nfo";
        text = "";
        inherit fg;
      }
      {
        name = "nim";
        text = "";
        inherit fg;
      }
      {
        name = "nix";
        text = "";
        inherit fg;
      }
      {
        name = "norg";
        text = "";
        inherit fg;
      }
      {
        name = "nswag";
        text = "";
        inherit fg;
      }
      {
        name = "nu";
        text = "";
        inherit fg;
      }
      {
        name = "o";
        text = "";
        inherit fg;
      }
      {
        name = "obj";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "odf";
        text = "";
        inherit fg;
      }
      {
        name = "odg";
        text = "";
        inherit fg;
      }
      {
        name = "odin";
        text = "󰟢";
        inherit fg;
      }
      {
        name = "odp";
        text = "";
        inherit fg;
      }
      {
        name = "ods";
        text = "";
        inherit fg;
      }
      {
        name = "odt";
        text = "";
        inherit fg;
      }
      {
        name = "oga";
        text = "";
        inherit fg;
      }
      {
        name = "ogg";
        text = "";
        inherit fg;
      }
      {
        name = "ogv";
        text = "";
        inherit fg;
      }
      {
        name = "ogx";
        text = "";
        inherit fg;
      }
      {
        name = "opus";
        text = "";
        inherit fg;
      }
      {
        name = "org";
        text = "";
        inherit fg;
      }
      {
        name = "otf";
        text = "";
        inherit fg;
      }
      {
        name = "out";
        text = "";
        inherit fg;
      }
      {
        name = "part";
        text = "";
        inherit fg;
      }
      {
        name = "patch";
        text = "";
        inherit fg;
      }
      {
        name = "pck";
        text = "";
        inherit fg;
      }
      {
        name = "pcm";
        text = "";
        inherit fg;
      }
      {
        name = "pdf";
        text = "";
        inherit fg;
      }
      {
        name = "php";
        text = "";
        inherit fg;
      }
      {
        name = "pl";
        text = "";
        inherit fg;
      }
      {
        name = "pls";
        text = "󰲹";
        inherit fg;
      }
      {
        name = "ply";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "pm";
        text = "";
        inherit fg;
      }
      {
        name = "png";
        text = "";
        inherit fg;
      }
      {
        name = "po";
        text = "";
        inherit fg;
      }
      {
        name = "pot";
        text = "";
        inherit fg;
      }
      {
        name = "pp";
        text = "";
        inherit fg;
      }
      {
        name = "ppt";
        text = "󰈧";
        inherit fg;
      }
      {
        name = "pptx";
        text = "󰈧";
        inherit fg;
      }
      {
        name = "prisma";
        text = "";
        inherit fg;
      }
      {
        name = "pro";
        text = "";
        inherit fg;
      }
      {
        name = "ps1";
        text = "󰨊";
        inherit fg;
      }
      {
        name = "psb";
        text = "";
        inherit fg;
      }
      {
        name = "psd";
        text = "";
        inherit fg;
      }
      {
        name = "psd1";
        text = "󰨊";
        inherit fg;
      }
      {
        name = "psm1";
        text = "󰨊";
        inherit fg;
      }
      {
        name = "pub";
        text = "󰷖";
        inherit fg;
      }
      {
        name = "pxd";
        text = "";
        inherit fg;
      }
      {
        name = "pxi";
        text = "";
        inherit fg;
      }
      {
        name = "py";
        text = "";
        inherit fg;
      }
      {
        name = "pyc";
        text = "";
        inherit fg;
      }
      {
        name = "pyd";
        text = "";
        inherit fg;
      }
      {
        name = "pyi";
        text = "";
        inherit fg;
      }
      {
        name = "pyo";
        text = "";
        inherit fg;
      }
      {
        name = "pyw";
        text = "";
        inherit fg;
      }
      {
        name = "pyx";
        text = "";
        inherit fg;
      }
      {
        name = "qm";
        text = "";
        inherit fg;
      }
      {
        name = "qml";
        text = "";
        inherit fg;
      }
      {
        name = "qrc";
        text = "";
        inherit fg;
      }
      {
        name = "qss";
        text = "";
        inherit fg;
      }
      {
        name = "query";
        text = "";
        inherit fg;
      }
      {
        name = "R";
        text = "󰟔";
        inherit fg;
      }
      {
        name = "r";
        text = "󰟔";
        inherit fg;
      }
      {
        name = "rake";
        text = "";
        inherit fg;
      }
      {
        name = "rar";
        text = "";
        inherit fg;
      }
      {
        name = "rasi";
        text = "";
        inherit fg;
      }
      {
        name = "razor";
        text = "󱦘";
        inherit fg;
      }
      {
        name = "rb";
        text = "";
        inherit fg;
      }
      {
        name = "res";
        text = "";
        inherit fg;
      }
      {
        name = "resi";
        text = "";
        inherit fg;
      }
      {
        name = "rlib";
        text = "";
        inherit fg;
      }
      {
        name = "rmd";
        text = "";
        inherit fg;
      }
      {
        name = "rproj";
        text = "󰗆";
        inherit fg;
      }
      {
        name = "rs";
        text = "";
        inherit fg;
      }
      {
        name = "rss";
        text = "";
        inherit fg;
      }
      {
        name = "s";
        text = "";
        inherit fg;
      }
      {
        name = "sass";
        text = "";
        inherit fg;
      }
      {
        name = "sbt";
        text = "";
        inherit fg;
      }
      {
        name = "sc";
        text = "";
        inherit fg;
      }
      {
        name = "scad";
        text = "";
        inherit fg;
      }
      {
        name = "scala";
        text = "";
        inherit fg;
      }
      {
        name = "scm";
        text = "󰘧";
        inherit fg;
      }
      {
        name = "scss";
        text = "";
        inherit fg;
      }
      {
        name = "sh";
        text = "";
        inherit fg;
      }
      {
        name = "sha1";
        text = "󰕥";
        inherit fg;
      }
      {
        name = "sha224";
        text = "󰕥";
        inherit fg;
      }
      {
        name = "sha256";
        text = "󰕥";
        inherit fg;
      }
      {
        name = "sha384";
        text = "󰕥";
        inherit fg;
      }
      {
        name = "sha512";
        text = "󰕥";
        inherit fg;
      }
      {
        name = "sig";
        text = "󰘧";
        inherit fg;
      }
      {
        name = "signature";
        text = "󰘧";
        inherit fg;
      }
      {
        name = "skp";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "sldasm";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "sldprt";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "slim";
        text = "";
        inherit fg;
      }
      {
        name = "sln";
        text = "";
        inherit fg;
      }
      {
        name = "slnx";
        text = "";
        inherit fg;
      }
      {
        name = "slvs";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "sml";
        text = "󰘧";
        inherit fg;
      }
      {
        name = "so";
        text = "";
        inherit fg;
      }
      {
        name = "sol";
        text = "";
        inherit fg;
      }
      {
        name = "spec.js";
        text = "";
        inherit fg;
      }
      {
        name = "spec.jsx";
        text = "";
        inherit fg;
      }
      {
        name = "spec.ts";
        text = "";
        inherit fg;
      }
      {
        name = "spec.tsx";
        text = "";
        inherit fg;
      }
      {
        name = "spx";
        text = "";
        inherit fg;
      }
      {
        name = "sql";
        text = "";
        inherit fg;
      }
      {
        name = "sqlite";
        text = "";
        inherit fg;
      }
      {
        name = "sqlite3";
        text = "";
        inherit fg;
      }
      {
        name = "srt";
        text = "󰨖";
        inherit fg;
      }
      {
        name = "ssa";
        text = "󰨖";
        inherit fg;
      }
      {
        name = "ste";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "step";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "stl";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "stories.js";
        text = "";
        inherit fg;
      }
      {
        name = "stories.jsx";
        text = "";
        inherit fg;
      }
      {
        name = "stories.mjs";
        text = "";
        inherit fg;
      }
      {
        name = "stories.svelte";
        text = "";
        inherit fg;
      }
      {
        name = "stories.ts";
        text = "";
        inherit fg;
      }
      {
        name = "stories.tsx";
        text = "";
        inherit fg;
      }
      {
        name = "stories.vue";
        text = "";
        inherit fg;
      }
      {
        name = "stp";
        text = "󰻫";
        inherit fg;
      }
      {
        name = "strings";
        text = "";
        inherit fg;
      }
      {
        name = "styl";
        text = "";
        inherit fg;
      }
      {
        name = "sub";
        text = "󰨖";
        inherit fg;
      }
      {
        name = "sublime";
        text = "";
        inherit fg;
      }
      {
        name = "suo";
        text = "";
        inherit fg;
      }
      {
        name = "sv";
        text = "󰍛";
        inherit fg;
      }
      {
        name = "svelte";
        text = "";
        inherit fg;
      }
      {
        name = "svg";
        text = "󰜡";
        inherit fg;
      }
      {
        name = "svgz";
        text = "󰜡";
        inherit fg;
      }
      {
        name = "svh";
        text = "󰍛";
        inherit fg;
      }
      {
        name = "swift";
        text = "";
        inherit fg;
      }
      {
        name = "t";
        text = "";
        inherit fg;
      }
      {
        name = "tbc";
        text = "󰛓";
        inherit fg;
      }
      {
        name = "tcl";
        text = "󰛓";
        inherit fg;
      }
      {
        name = "templ";
        text = "";
        inherit fg;
      }
      {
        name = "terminal";
        text = "";
        inherit fg;
      }
      {
        name = "test.js";
        text = "";
        inherit fg;
      }
      {
        name = "test.jsx";
        text = "";
        inherit fg;
      }
      {
        name = "test.ts";
        text = "";
        inherit fg;
      }
      {
        name = "test.tsx";
        text = "";
        inherit fg;
      }
      {
        name = "tex";
        text = "";
        inherit fg;
      }
      {
        name = "tf";
        text = "";
        inherit fg;
      }
      {
        name = "tfvars";
        text = "";
        inherit fg;
      }
      {
        name = "tgz";
        text = "";
        inherit fg;
      }
      {
        name = "tmpl";
        text = "";
        inherit fg;
      }
      {
        name = "tmux";
        text = "";
        inherit fg;
      }
      {
        name = "toml";
        text = "";
        inherit fg;
      }
      {
        name = "torrent";
        text = "";
        inherit fg;
      }
      {
        name = "tres";
        text = "";
        inherit fg;
      }
      {
        name = "ts";
        text = "";
        inherit fg;
      }
      {
        name = "tscn";
        text = "";
        inherit fg;
      }
      {
        name = "tsconfig";
        text = "";
        inherit fg;
      }
      {
        name = "tsx";
        text = "";
        inherit fg;
      }
      {
        name = "ttf";
        text = "";
        inherit fg;
      }
      {
        name = "twig";
        text = "";
        inherit fg;
      }
      {
        name = "txt";
        text = "󰈙";
        inherit fg;
      }
      {
        name = "txz";
        text = "";
        inherit fg;
      }
      {
        name = "typ";
        text = "";
        inherit fg;
      }
      {
        name = "typoscript";
        text = "";
        inherit fg;
      }
      {
        name = "ui";
        text = "";
        inherit fg;
      }
      {
        name = "v";
        text = "󰍛";
        inherit fg;
      }
      {
        name = "vala";
        text = "";
        inherit fg;
      }
      {
        name = "vert";
        text = "";
        inherit fg;
      }
      {
        name = "vh";
        text = "󰍛";
        inherit fg;
      }
      {
        name = "vhd";
        text = "󰍛";
        inherit fg;
      }
      {
        name = "vhdl";
        text = "󰍛";
        inherit fg;
      }
      {
        name = "vi";
        text = "";
        inherit fg;
      }
      {
        name = "vim";
        text = "";
        inherit fg;
      }
      {
        name = "vsh";
        text = "";
        inherit fg;
      }
      {
        name = "vsix";
        text = "";
        inherit fg;
      }
      {
        name = "vue";
        text = "";
        inherit fg;
      }
      {
        name = "wasm";
        text = "";
        inherit fg;
      }
      {
        name = "wav";
        text = "";
        inherit fg;
      }
      {
        name = "webm";
        text = "";
        inherit fg;
      }
      {
        name = "webmanifest";
        text = "";
        inherit fg;
      }
      {
        name = "webp";
        text = "";
        inherit fg;
      }
      {
        name = "webpack";
        text = "󰜫";
        inherit fg;
      }
      {
        name = "wma";
        text = "";
        inherit fg;
      }
      {
        name = "wmv";
        text = "";
        inherit fg;
      }
      {
        name = "woff";
        text = "";
        inherit fg;
      }
      {
        name = "woff2";
        text = "";
        inherit fg;
      }
      {
        name = "wrl";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "wrz";
        text = "󰆧";
        inherit fg;
      }
      {
        name = "wv";
        text = "";
        inherit fg;
      }
      {
        name = "wvc";
        text = "";
        inherit fg;
      }
      {
        name = "x";
        text = "";
        inherit fg;
      }
      {
        name = "xaml";
        text = "󰙳";
        inherit fg;
      }
      {
        name = "xcf";
        text = "";
        inherit fg;
      }
      {
        name = "xcplayground";
        text = "";
        inherit fg;
      }
      {
        name = "xcstrings";
        text = "";
        inherit fg;
      }
      {
        name = "xls";
        text = "󰈛";
        inherit fg;
      }
      {
        name = "xlsx";
        text = "󰈛";
        inherit fg;
      }
      {
        name = "xm";
        text = "";
        inherit fg;
      }
      {
        name = "xml";
        text = "󰗀";
        inherit fg;
      }
      {
        name = "xpi";
        text = "";
        inherit fg;
      }
      {
        name = "xslt";
        text = "󰗀";
        inherit fg;
      }
      {
        name = "xul";
        text = "";
        inherit fg;
      }
      {
        name = "xz";
        text = "";
        inherit fg;
      }
      {
        name = "yaml";
        text = "";
        inherit fg;
      }
      {
        name = "yml";
        text = "";
        inherit fg;
      }
      {
        name = "zig";
        text = "";
        inherit fg;
      }
      {
        name = "zip";
        text = "";
        inherit fg;
      }
      {
        name = "zsh";
        text = "";
        inherit fg;
      }
      {
        name = "zst";
        text = "";
        inherit fg;
      }
      {
        name = "🔥";
        text = "";
        inherit fg;
      }
    ];

    files = [
      {
        name = ".babelrc";
        text = "";
        inherit fg;
      }
      {
        name = ".bash_profile";
        text = "";
        inherit fg;
      }
      {
        name = ".bashrc";
        text = "";
        inherit fg;
      }
      {
        name = ".clang-format";
        text = "";
        inherit fg;
      }
      {
        name = ".clang-tidy";
        text = "";
        inherit fg;
      }
      {
        name = ".codespellrc";
        text = "󰓆";
        inherit fg;
      }
      {
        name = ".condarc";
        text = "";
        inherit fg;
      }
      {
        name = ".dockerignore";
        text = "󰡨";
        inherit fg;
      }
      {
        name = ".ds_store";
        text = "";
        inherit fg;
      }
      {
        name = ".editorconfig";
        text = "";
        inherit fg;
      }
      {
        name = ".env";
        text = "";
        inherit fg;
      }
      {
        name = ".eslintignore";
        text = "";
        inherit fg;
      }
      {
        name = ".eslintrc";
        text = "";
        inherit fg;
      }
      {
        name = ".git-blame-ignore-revs";
        text = "";
        inherit fg;
      }
      {
        name = ".gitattributes";
        text = "";
        inherit fg;
      }
      {
        name = ".gitconfig";
        text = "";
        inherit fg;
      }
      {
        name = ".gitignore";
        text = "";
        inherit fg;
      }
      {
        name = ".gitlab-ci.yml";
        text = "";
        inherit fg;
      }
      {
        name = ".gitmodules";
        text = "";
        inherit fg;
      }
      {
        name = ".gtkrc-2.0";
        text = "";
        inherit fg;
      }
      {
        name = ".gvimrc";
        text = "";
        inherit fg;
      }
      {
        name = ".justfile";
        text = "";
        inherit fg;
      }
      {
        name = ".luacheckrc";
        text = "";
        inherit fg;
      }
      {
        name = ".luaurc";
        text = "";
        inherit fg;
      }
      {
        name = ".mailmap";
        text = "󰊢";
        inherit fg;
      }
      {
        name = ".nanorc";
        text = "";
        inherit fg;
      }
      {
        name = ".npmignore";
        text = "";
        inherit fg;
      }
      {
        name = ".npmrc";
        text = "";
        inherit fg;
      }
      {
        name = ".nuxtrc";
        text = "󱄆";
        inherit fg;
      }
      {
        name = ".nvmrc";
        text = "";
        inherit fg;
      }
      {
        name = ".pnpmfile.cjs";
        text = "";
        inherit fg;
      }
      {
        name = ".pre-commit-config.yaml";
        text = "󰛢";
        inherit fg;
      }
      {
        name = ".prettierignore";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.cjs";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.js";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.json";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.json5";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.mjs";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.toml";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.yaml";
        text = "";
        inherit fg;
      }
      {
        name = ".prettierrc.yml";
        text = "";
        inherit fg;
      }
      {
        name = ".pylintrc";
        text = "";
        inherit fg;
      }
      {
        name = ".settings.json";
        text = "";
        inherit fg;
      }
      {
        name = ".SRCINFO";
        text = "󰣇";
        inherit fg;
      }
      {
        name = ".vimrc";
        text = "";
        inherit fg;
      }
      {
        name = ".Xauthority";
        text = "";
        inherit fg;
      }
      {
        name = ".xinitrc";
        text = "";
        inherit fg;
      }
      {
        name = ".Xresources";
        text = "";
        inherit fg;
      }
      {
        name = ".xsession";
        text = "";
        inherit fg;
      }
      {
        name = ".zprofile";
        text = "";
        inherit fg;
      }
      {
        name = ".zshenv";
        text = "";
        inherit fg;
      }
      {
        name = ".zshrc";
        text = "";
        inherit fg;
      }
      {
        name = "_gvimrc";
        text = "";
        inherit fg;
      }
      {
        name = "_vimrc";
        text = "";
        inherit fg;
      }
      {
        name = "AUTHORS";
        text = "";
        inherit fg;
      }
      {
        name = "AUTHORS.txt";
        text = "";
        inherit fg;
      }
      {
        name = "brewfile";
        text = "";
        inherit fg;
      }
      {
        name = "bspwmrc";
        text = "";
        inherit fg;
      }
      {
        name = "build";
        text = "";
        inherit fg;
      }
      {
        name = "build.gradle";
        text = "";
        inherit fg;
      }
      {
        name = "build.zig.zon";
        text = "";
        inherit fg;
      }
      {
        name = "bun.lock";
        text = "";
        inherit fg;
      }
      {
        name = "bun.lockb";
        text = "";
        inherit fg;
      }
      {
        name = "cantorrc";
        text = "";
        inherit fg;
      }
      {
        name = "checkhealth";
        text = "󰓙";
        inherit fg;
      }
      {
        name = "cmakelists.txt";
        text = "";
        inherit fg;
      }
      {
        name = "code_of_conduct";
        text = "";
        inherit fg;
      }
      {
        name = "code_of_conduct.md";
        text = "";
        inherit fg;
      }
      {
        name = "commit_editmsg";
        text = "";
        inherit fg;
      }
      {
        name = "commitlint.config.js";
        text = "󰜘";
        inherit fg;
      }
      {
        name = "commitlint.config.ts";
        text = "󰜘";
        inherit fg;
      }
      {
        name = "compose.yaml";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "compose.yml";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "config";
        text = "";
        inherit fg;
      }
      {
        name = "containerfile";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "copying";
        text = "";
        inherit fg;
      }
      {
        name = "copying.lesser";
        text = "";
        inherit fg;
      }
      {
        name = "Directory.Build.props";
        text = "";
        inherit fg;
      }
      {
        name = "Directory.Build.targets";
        text = "";
        inherit fg;
      }
      {
        name = "Directory.Packages.props";
        text = "";
        inherit fg;
      }
      {
        name = "docker-compose.yaml";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "docker-compose.yml";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "dockerfile";
        text = "󰡨";
        inherit fg;
      }
      {
        name = "eslint.config.cjs";
        text = "";
        inherit fg;
      }
      {
        name = "eslint.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "eslint.config.mjs";
        text = "";
        inherit fg;
      }
      {
        name = "eslint.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "ext_typoscript_setup.txt";
        text = "";
        inherit fg;
      }
      {
        name = "favicon.ico";
        text = "";
        inherit fg;
      }
      {
        name = "fp-info-cache";
        text = "";
        inherit fg;
      }
      {
        name = "fp-lib-table";
        text = "";
        inherit fg;
      }
      {
        name = "FreeCAD.conf";
        text = "";
        inherit fg;
      }
      {
        name = "Gemfile";
        text = "";
        inherit fg;
      }
      {
        name = "gnumakefile";
        text = "";
        inherit fg;
      }
      {
        name = "go.mod";
        text = "";
        inherit fg;
      }
      {
        name = "go.sum";
        text = "";
        inherit fg;
      }
      {
        name = "go.work";
        text = "";
        inherit fg;
      }
      {
        name = "gradle-wrapper.properties";
        text = "";
        inherit fg;
      }
      {
        name = "gradle.properties";
        text = "";
        inherit fg;
      }
      {
        name = "gradlew";
        text = "";
        inherit fg;
      }
      {
        name = "groovy";
        text = "";
        inherit fg;
      }
      {
        name = "gruntfile.babel.js";
        text = "";
        inherit fg;
      }
      {
        name = "gruntfile.coffee";
        text = "";
        inherit fg;
      }
      {
        name = "gruntfile.js";
        text = "";
        inherit fg;
      }
      {
        name = "gruntfile.ts";
        text = "";
        inherit fg;
      }
      {
        name = "gtkrc";
        text = "";
        inherit fg;
      }
      {
        name = "gulpfile.babel.js";
        text = "";
        inherit fg;
      }
      {
        name = "gulpfile.coffee";
        text = "";
        inherit fg;
      }
      {
        name = "gulpfile.js";
        text = "";
        inherit fg;
      }
      {
        name = "gulpfile.ts";
        text = "";
        inherit fg;
      }
      {
        name = "hypridle.conf";
        text = "";
        inherit fg;
      }
      {
        name = "hyprland.conf";
        text = "";
        inherit fg;
      }
      {
        name = "hyprlandd.conf";
        text = "";
        inherit fg;
      }
      {
        name = "hyprlock.conf";
        text = "";
        inherit fg;
      }
      {
        name = "hyprpaper.conf";
        text = "";
        inherit fg;
      }
      {
        name = "hyprsunset.conf";
        text = "";
        inherit fg;
      }
      {
        name = "i18n.config.js";
        text = "󰗊";
        inherit fg;
      }
      {
        name = "i18n.config.ts";
        text = "󰗊";
        inherit fg;
      }
      {
        name = "i3blocks.conf";
        text = "";
        inherit fg;
      }
      {
        name = "i3status.conf";
        text = "";
        inherit fg;
      }
      {
        name = "index.theme";
        text = "";
        inherit fg;
      }
      {
        name = "ionic.config.json";
        text = "";
        inherit fg;
      }
      {
        name = "Jenkinsfile";
        text = "";
        inherit fg;
      }
      {
        name = "justfile";
        text = "";
        inherit fg;
      }
      {
        name = "kalgebrarc";
        text = "";
        inherit fg;
      }
      {
        name = "kdeglobals";
        text = "";
        inherit fg;
      }
      {
        name = "kdenlive-layoutsrc";
        text = "";
        inherit fg;
      }
      {
        name = "kdenliverc";
        text = "";
        inherit fg;
      }
      {
        name = "kritadisplayrc";
        text = "";
        inherit fg;
      }
      {
        name = "kritarc";
        text = "";
        inherit fg;
      }
      {
        name = "license";
        text = "";
        inherit fg;
      }
      {
        name = "license.md";
        text = "";
        inherit fg;
      }
      {
        name = "lxde-rc.xml";
        text = "";
        inherit fg;
      }
      {
        name = "lxqt.conf";
        text = "";
        inherit fg;
      }
      {
        name = "makefile";
        text = "";
        inherit fg;
      }
      {
        name = "mix.lock";
        text = "";
        inherit fg;
      }
      {
        name = "mpv.conf";
        text = "";
        inherit fg;
      }
      {
        name = "next.config.cjs";
        text = "";
        inherit fg;
      }
      {
        name = "next.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "next.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "node_modules";
        text = "";
        inherit fg;
      }
      {
        name = "nuxt.config.cjs";
        text = "󱄆";
        inherit fg;
      }
      {
        name = "nuxt.config.js";
        text = "󱄆";
        inherit fg;
      }
      {
        name = "nuxt.config.mjs";
        text = "󱄆";
        inherit fg;
      }
      {
        name = "nuxt.config.ts";
        text = "󱄆";
        inherit fg;
      }
      {
        name = "package-lock.json";
        text = "";
        inherit fg;
      }
      {
        name = "package.json";
        text = "";
        inherit fg;
      }
      {
        name = "PKGBUILD";
        text = "";
        inherit fg;
      }
      {
        name = "platformio.ini";
        text = "";
        inherit fg;
      }
      {
        name = "playwright.config.cjs";
        text = "";
        inherit fg;
      }
      {
        name = "playwright.config.cts";
        text = "";
        inherit fg;
      }
      {
        name = "playwright.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "playwright.config.mjs";
        text = "";
        inherit fg;
      }
      {
        name = "playwright.config.mts";
        text = "";
        inherit fg;
      }
      {
        name = "playwright.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "pnpm-lock.yaml";
        text = "";
        inherit fg;
      }
      {
        name = "pnpm-workspace.yaml";
        text = "";
        inherit fg;
      }
      {
        name = "pom.xml";
        text = "";
        inherit fg;
      }
      {
        name = "prettier.config.cjs";
        text = "";
        inherit fg;
      }
      {
        name = "prettier.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "prettier.config.mjs";
        text = "";
        inherit fg;
      }
      {
        name = "prettier.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "prisma.config.mts";
        text = "";
        inherit fg;
      }
      {
        name = "prisma.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "procfile";
        text = "";
        inherit fg;
      }
      {
        name = "PrusaSlicer.ini";
        text = "";
        inherit fg;
      }
      {
        name = "PrusaSlicerGcodeViewer.ini";
        text = "";
        inherit fg;
      }
      {
        name = "py.typed";
        text = "";
        inherit fg;
      }
      {
        name = "QtProject.conf";
        text = "";
        inherit fg;
      }
      {
        name = "rakefile";
        text = "";
        inherit fg;
      }
      {
        name = "readme";
        text = "󰂺";
        inherit fg;
      }
      {
        name = "readme.md";
        text = "󰂺";
        inherit fg;
      }
      {
        name = "rmd";
        text = "";
        inherit fg;
      }
      {
        name = "robots.txt";
        text = "󰚩";
        inherit fg;
      }
      {
        name = "security";
        text = "󰒃";
        inherit fg;
      }
      {
        name = "security.md";
        text = "󰒃";
        inherit fg;
      }
      {
        name = "settings.gradle";
        text = "";
        inherit fg;
      }
      {
        name = "svelte.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "sxhkdrc";
        text = "";
        inherit fg;
      }
      {
        name = "sym-lib-table";
        text = "";
        inherit fg;
      }
      {
        name = "tailwind.config.js";
        text = "󱏿";
        inherit fg;
      }
      {
        name = "tailwind.config.mjs";
        text = "󱏿";
        inherit fg;
      }
      {
        name = "tailwind.config.ts";
        text = "󱏿";
        inherit fg;
      }
      {
        name = "tmux.conf";
        text = "";
        inherit fg;
      }
      {
        name = "tmux.conf.local";
        text = "";
        inherit fg;
      }
      {
        name = "tsconfig.json";
        text = "";
        inherit fg;
      }
      {
        name = "unlicense";
        text = "";
        inherit fg;
      }
      {
        name = "vagrantfile";
        text = "";
        inherit fg;
      }
      {
        name = "vercel.json";
        text = "";
        inherit fg;
      }
      {
        name = "vite.config.cjs";
        text = "";
        inherit fg;
      }
      {
        name = "vite.config.cts";
        text = "";
        inherit fg;
      }
      {
        name = "vite.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "vite.config.mjs";
        text = "";
        inherit fg;
      }
      {
        name = "vite.config.mts";
        text = "";
        inherit fg;
      }
      {
        name = "vite.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "vitest.config.cjs";
        text = "";
        inherit fg;
      }
      {
        name = "vitest.config.cts";
        text = "";
        inherit fg;
      }
      {
        name = "vitest.config.js";
        text = "";
        inherit fg;
      }
      {
        name = "vitest.config.mjs";
        text = "";
        inherit fg;
      }
      {
        name = "vitest.config.mts";
        text = "";
        inherit fg;
      }
      {
        name = "vitest.config.ts";
        text = "";
        inherit fg;
      }
      {
        name = "vlcrc";
        text = "󰕼";
        inherit fg;
      }
      {
        name = "webpack";
        text = "󰜫";
        inherit fg;
      }
      {
        name = "weston.ini";
        text = "";
        inherit fg;
      }
      {
        name = "workspace";
        text = "";
        inherit fg;
      }
      {
        name = "wrangler.jsonc";
        text = "";
        inherit fg;
      }
      {
        name = "wrangler.toml";
        text = "";
        inherit fg;
      }
      {
        name = "xdph.conf";
        text = "";
        inherit fg;
      }
      {
        name = "xmobarrc";
        text = "";
        inherit fg;
      }
      {
        name = "xmobarrc.hs";
        text = "";
        inherit fg;
      }
      {
        name = "xmonad.hs";
        text = "";
        inherit fg;
      }
      {
        name = "xorg.conf";
        text = "";
        inherit fg;
      }
      {
        name = "xsettingsd.conf";
        text = "";
        inherit fg;
      }
    ];

    conds = [
      {
        "if" = "orphan";
        text = "";
        inherit fg;
      }
      {
        "if" = "link";
        text = "";
        inherit fg;
      }
      {
        "if" = "block";
        text = "";
        inherit fg;
      }
      {
        "if" = "char";
        text = "";
        inherit fg;
      }
      {
        "if" = "fifo";
        text = "";
        inherit fg;
      }
      {
        "if" = "sock";
        text = "";
        inherit fg;
      }
      {
        "if" = "sticky";
        text = "";
        inherit fg;
      }
      {
        "if" = "dummy";
        text = "";
        inherit fg;
      }
      {
        "if" = "dir";
        text = "";
        inherit fg;
      }
      {
        "if" = "exec";
        text = "";
        inherit fg;
      }
      {
        "if" = "!dir";
        text = "";
        inherit fg;
      }
    ];

    directories = [
      {
        name = ".config";
        text = "";
        inherit fg;
      }
      {
        name = ".git";
        text = "";
        inherit fg;
      }
      {
        name = ".github";
        text = "";
        inherit fg;
      }
      {
        name = ".npm";
        text = "";
        inherit fg;
      }
      {
        name = "Desktop";
        text = "";
        inherit fg;
      }
      {
        name = "Development";
        text = "";
        inherit fg;
      }
      {
        name = "Documents";
        text = "";
        inherit fg;
      }
      {
        name = "Downloads";
        text = "";
        inherit fg;
      }
      {
        name = "Library";
        text = "";
        inherit fg;
      }
      {
        name = "Movies";
        text = "";
        inherit fg;
      }
      {
        name = "Music";
        text = "";
        inherit fg;
      }
      {
        name = "Pictures";
        text = "";
        inherit fg;
      }
      {
        name = "Public";
        text = "";
        inherit fg;
      }
      {
        name = "Videos";
        text = "";
        inherit fg;
      }
    ];
  };
}

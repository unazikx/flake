{
  _master,
  fetchzip,
  autoPatchelfHook,
  brotli,
  dbus,
  fontconfig,
  freetype,
  graphite2,
  icu,
  krb5,
  libb2,
  libGL,
  libglvnd,
  libpng,
  libproxy,
  libX11,
  libxcb,
  libXcomposite,
  libXext,
  libXfixes,
  libxkbcommon,
  libXrandr,
  libXrender,
  libXtst,
  makeWrapper,
  openssl,
  pcre2,
  zlib,
  zstd,
  lib,
}:

_master.stdenv.mkDerivation (_final: {
  pname = "kenny-launcher";
  version = "9.4.4-dev";

  src = fetchzip {
    url = "https://github.com/ArtemBatsak/dev_kenny-/releases/download/v${_final.version}/KennyLauncher_${_final.version}_linux.zip";
    sha256 = "sha256-Ts0v95F+3UU8ADqlwRl6Swhzs6wvz1aKmmo2E1G42ck=";
    stripRoot = false;
  };

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  nativeBuildInputs = [
    makeWrapper
    autoPatchelfHook
  ];

  buildInputs = [
    zlib
    zstd
    brotli
    libproxy
    krb5
    _master.glib
    dbus
    fontconfig
    freetype
    libpng
    libGL
    libglvnd
    libX11
    libXext
    libXfixes
    libXcomposite
    libXrandr
    libXtst
    libxcb
    libXrender
    libxkbcommon
    graphite2
    libb2
    pcre2
    openssl
    icu
    _master.stdenv.cc.cc.lib
  ];

  libcurlGnutlsStub = _master.stdenv.mkDerivation {
    pname = "libcurl-gnutls-stub";
    version = "1.0";

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    buildCommand =
      # sh
      ''
        mkdir -p $out/lib

        cat > stub.c <<'EOF'
        #define STUB(x) \
          void x() {} \
          __asm__(".symver " #x "," #x "@CURL_GNUTLS_3")

        STUB(curl_easy_init);
        STUB(curl_easy_setopt);
        STUB(curl_easy_perform);
        STUB(curl_easy_cleanup);
        STUB(curl_easy_strerror);
        STUB(curl_easy_getinfo);
        STUB(curl_multi_init);
        STUB(curl_multi_add_handle);
        STUB(curl_multi_remove_handle);
        STUB(curl_multi_perform);
        STUB(curl_multi_cleanup);
        STUB(curl_slist_append);
        STUB(curl_slist_free_all);
        STUB(curl_free);
        STUB(curl_version);
        STUB(curl_version_info);
        EOF

        cat > vers.map <<'EOF'
        CURL_GNUTLS_3 {
          global:
            curl_easy_init;
            curl_easy_setopt;
            curl_easy_perform;
            curl_easy_cleanup;
            curl_easy_strerror;
            curl_easy_getinfo;
            curl_multi_init;
            curl_multi_add_handle;
            curl_multi_remove_handle;
            curl_multi_perform;
            curl_multi_cleanup;
            curl_slist_append;
            curl_slist_free_all;
            curl_free;
            curl_version;
            curl_version_info;
          local: *;
        };
        EOF

        ${_master.stdenv.cc}/bin/cc -fPIC -shared \
          -Wl,--version-script=vers.map \
          -Wl,-soname,libcurl-gnutls.so.4 \
          -o $out/lib/libcurl-gnutls.so.4 \
          stub.c
      '';
  };

  preFixup = ''
    for f in $out/lib/libpxbackend-*.so; do
      if [ -e "$f" ]; then
        patchelf --add-rpath "${_final.libcurlGnutlsStub}/lib" "$f" || true
      fi
    done
  '';

  autoPatchelfIgnoreMissingDeps = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r ./* $out/

    chmod +x $out/KennyLauncher

    makeWrapper $out/KennyLauncher $out/bin/kenny-launcher \
      --prefix LD_LIBRARY_PATH : "${_final.libcurlGnutlsStub}/lib:$out/lib:${lib.makeLibraryPath _final.buildInputs}"

    runHook postInstall
  '';

  meta = {
    description = "Russian fucking shit launcher";
    homepage = "https://github.com/ArtemBatsak/KennyLauncher";
    license = lib.licenses.unfree;
    mainProgram = "kenny-launcher";
  };
})

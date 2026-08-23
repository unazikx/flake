{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin (_old: {
  pname = "piper";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "alberti42";
    repo = "faster-piper.yazi";
    tag = "v${_old.version}";
    hash = "sha256-a7/KTIoIU9idxhYmYFsp6/ezmiBK/mEYfEz9zqZZiEU=";
  };

  meta = {
    description = "Pipe any shell command as a cached previewer";
    homepage = "https://github.com/alberti42/faster-piper.yazi";
    license = lib.licenses.mit;
  };
})

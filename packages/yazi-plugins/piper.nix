{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "piper";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "alberti42";
    repo = "faster-piper.yazi";
    rev = "8b794bfa3bc9c780e3f03b6f5a0ccde7744e54bb";
    hash = "sha256-m6ZiwA36lcdZORK3KIz4Xq3bs7mmtC6j62B/+BuDGAQ=";
  };

  meta = {
    description = "Pipe any shell command as a cached previewer";
    homepage = "https://github.com/alberti42/faster-piper.yazi";
    license = lib.licenses.mit;
  };
}

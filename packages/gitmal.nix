{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule (_old: {
  pname = "gitmal";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "antonmedv";
    repo = "gitmal";
    rev = "v${_old.version}";
    hash = "sha256-RDXtB/fgyqL3b5e2BVK5si5pIcw/un3KJy1/cU0GMXo=";
  };

  vendorHash = "sha256-12kkN1rh9OWG8YIr9KyHtm1TFJQPUtSpD6ub8zokAhQ=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "Static page generator for Git repositories";
    homepage = "https://github.com/antonmedv/gitmal";
    license = lib.licenses.mit;
    mainProgram = "gitmal";
  };
})

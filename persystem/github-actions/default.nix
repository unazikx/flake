{
  ...
}:

{
  perSystem =
    {
      pkgs,
      config,
      ...
    }:
    {
      githubActions.enable = true;

      packages.workflows = pkgs.runCommand "copy-workflows" { } ''
        mkdir -p $out && cp -r ${config.githubActions.workflowsDir}/* $out
      '';
    };
}

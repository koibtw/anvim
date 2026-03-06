{
  lib,
  newScope,
  vimUtils,
}:
let
  inherit (lib) makeScope;
  inherit (builtins)
    mapAttrs
    ;

  npins = import ./npins { };
  sources = mapAttrs (
    n: v:
    let
      src = v { };
    in
    {
      inherit src;
      passthru.as = n;
    }
  ) npins;

  mkPlugin =
    name: args:
    let
      oa = sources.${name};

      passthru = args.passthru or { } // {
        as = args.passthru.as or oa.passthru.as;
        start = if (args ? passthru && args.passthru ? start) then args.passthru.start else false;
      };
    in
    vimUtils.buildVimPlugin (
      oa
      // args
      // {
        pname = args.pname or passthru.as;
        version = "0-dev${oa.src.revision}";

        doCheck = false;

        inherit passthru;
      }
    );

  generatedPlugins = mapAttrs (n: _: mkPlugin n { }) sources;

  madePlugins =
    let
      start = {
        passthru.start = true;
      };
    in
    {
      lynn = mkPlugin "lynn" start;
      lspconfig = mkPlugin "lspconfig" start;
    };

  plugins = generatedPlugins // madePlugins;
in
makeScope newScope (_: plugins)

{
  lib,
  newScope,
  vimUtils,
  callPackage,
}:
let
  inherit (lib) makeScope;
  inherit (lib.trivial) importTOML;
  inherit (builtins) mapAttrs fromJSON replaceStrings;

  toml = importTOML ./nvfetcher.toml;
  sources = removeAttrs (callPackage ./_sources/generated.nix { }) [
    "override"
    "overrideDerivation"
  ];

  mkPlugin =
    name: args:
    let
      old = toml.${name};

      args' = removeAttrs args [
        "pname"
        "date"
        "version"
        "passthru"
      ];
    in
    vimUtils.buildVimPlugin (
      args'
      // {
        pname = old.passthru.as or (baseNameOf old.src.git);
        version = replaceStrings [ "-" ] [ "." ] args.date;

        doCheck = false;

        passthru = args.passthru or { } // {
          start = if (args ? start) then fromJSON args.start else false;
        };
      }
    );

  generatedPlugins = mapAttrs mkPlugin sources;

  madePlugins = {
    evergarden-nvim = mkPlugin "evergarden-nvim" (
      sources.evergarden-nvim
      // {
        postInstall = ''
          mkdir $target/.git
          cat > $target/.git/HEAD <<EOF
          ${sources.evergarden-nvim.src.rev}
          EOF
        '';
      }
    );
  };

  plugins = generatedPlugins // madePlugins;
in
makeScope newScope (_: plugins)

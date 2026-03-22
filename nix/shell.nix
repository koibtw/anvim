{ pkgs }:

let
  pkgInputs = with pkgs; [ lua-language-server ];
in
pkgs.mkShell {
  packages = pkgInputs;

  shellHook = ''
    echo -ne "-----------------------------------\n "
    echo -n "${toString (map (pkg: "• ${pkg.name}\n") pkgInputs)}"
    echo "-----------------------------------"
  '';
}

{ mkShell, lua-language-server }:
let
  packages = [ lua-language-server ];
in
mkShell {
  inherit packages;
  shellHook = ''
    echo -ne "-----------------------------------\n "
    echo -n "${toString (map (pkg: "• ${pkg.name}\n") packages)}"
    echo "-----------------------------------"
  '';
}

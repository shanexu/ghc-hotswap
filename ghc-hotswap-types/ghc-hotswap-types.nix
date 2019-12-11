{ nix-gitignore, mkDerivation, base, stdenv }:
mkDerivation {
  pname = "ghc-hotswap-types";
  version = "0.1.0.0";
  src = nix-gitignore.gitignoreSourcePure [../.gitignore] ./.;
  libraryHaskellDepends = [ base ];
  testHaskellDepends = [ base ];
  license = stdenv.lib.licenses.mit;
}

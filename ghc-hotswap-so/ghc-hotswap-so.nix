{ mkDerivation, base, stdenv, ghc-hotswap-types, nix-gitignore }:
mkDerivation {
  pname = "ghc-hotswap-so";
  version = "0.1.0.0";
  src = nix-gitignore.gitignoreSourcePure [../.gitignore] ./.;
  libraryHaskellDepends = [ base ghc-hotswap-types ];
  testHaskellDepends = [ base ghc-hotswap-types ];
  license = stdenv.lib.licenses.mit;
}

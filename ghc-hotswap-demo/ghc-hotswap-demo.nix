{ mkDerivation, base, stdenv, nix-gitignore, ghc-hotswap, ghc-hotswap-types }:
mkDerivation {
  pname = "ghc-hotswap-demo";
  version = "0.1.0.0";
  src = nix-gitignore.gitignoreSourcePure [../.gitignore] ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ghc-hotswap ghc-hotswap-types ];
  license = stdenv.lib.licenses.mit;
}

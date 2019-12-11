{ nix-gitignore, mkDerivation, base, deepseq, text, stdenv }:
mkDerivation {
  pname = "ghc-hotswap-types";
  version = "0.1.0.0";
  src = nix-gitignore.gitignoreSourcePure [../.gitignore] ./.;
  libraryHaskellDepends = [ base deepseq text ];
  testHaskellDepends = [ base deepseq text ];
  license = stdenv.lib.licenses.mit;
}

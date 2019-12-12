{ compiler ? "ghc844" }:
let
  inherit (import ./pkgs.nix) pkgs all-hies;
  ghc = pkgs.haskell.packages.${compiler}.ghcWithPackages (ps: with ps; [
    ghc-hotswap
    cabal-install
  ]);
in
pkgs.stdenv.mkDerivation {
  name = "my-haskell-env-0";
  buildInputs = [
    ghc
    (all-hies.selection { selector = p: { inherit (p) ghc844; }; })
  ];
}

{ compiler ? "ghc844" }:
let
  config = {
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
          "${compiler}" = pkgs.haskell.packages."${compiler}".override {
            overrides = haskellPackagesNew: haskellPackagesOld: rec {
              ghc-hotswap-types = haskellPackagesNew.callPackage ./ghc-hotswap-types/ghc-hotswap-types.nix { };
              ghc-hotswap-so = haskellPackagesNew.callPackage ./ghc-hotswap-so/ghc-hotswap-so.nix { };
              ghc-hotswap-demo = haskellPackagesNew.callPackage ./ghc-hotswap-demo/ghc-hotswap-demo.nix { };
            };
          };
        };
      };
    };
  };
  pkgs = (import ./pkgs.nix).pkgs { inherit config; };
in
with pkgs.haskell.packages.${compiler}; {
  inherit ghc-hotswap-types ghc-hotswap-so ghc-hotswap-demo;
}

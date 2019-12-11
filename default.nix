let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          ghc-hotswap-types = haskellPackages.callPackage ./ghc-hotswap-types/ghc-hotswap-types.nix { };
        };
      };
    };
  };
  pkgs = (import ./pkgs.nix).pkgs { inherit config; };
in
with pkgs.haskellPackages; {
  inherit ghc-hotswap-types;
}

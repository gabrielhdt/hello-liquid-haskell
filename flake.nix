{
  description = "Flake for a liquid haskell project";
  inputs = {
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          hPkgs = pkgs.haskell.packages.ghc8107;
      in {
          devShells.default = pkgs.mkShell {
              buildInputs = with hPkgs; [
                  ghc cabal-install
                  # haskell-language-server
                  hpack
              ] ++ [ pkgs.z3 ];
          };
      }
    );
}

{
  description = "Alec S. Zabel-Mena";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-26.05";
  };

  outputs = {self, nixpkgs}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system} = {
      test = pkgs.mkShell{
        name = "test";

        nativeBuildInputs = with pkgs; [
          go
          hugo
          nodejs
        ];
      };
    };
  };

}

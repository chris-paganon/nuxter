let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/53a2c32bc66f5ae41a28d7a9a49d321172af621e.tar.gz";
  pkgs = import nixpkgs { config = {}; overlays = []; };

in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    nodejs_20
  ];
}
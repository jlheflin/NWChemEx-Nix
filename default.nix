let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  pythonEnv = pkgs.python312.withPackages (ps: with ps; [ ase qcelemental pip qcengine networkx ]);
  parallelzone = pkgs.callPackage ./parallelzone.nix {inherit pythonEnv; };

in
{
  parallelzone = parallelzone;
}

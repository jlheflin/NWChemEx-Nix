{ pkgs, lib, fetchFromGitHub, cmake, spdlog, gcc, mpi, boost, cereal, stdenv }:

let
  pythonEnv = pkgs.python313.withPackages (ps: with ps; [ ase qcelemental pip qcengine networkx ]);
in
pkgs.callPackage ./parallelzone.nix {
  inherit pythonEnv stdenv lib fetchFromGitHub cmake spdlog gcc mpi boost cereal;
}

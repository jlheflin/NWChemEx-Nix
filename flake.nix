{
  description = "NWchemEX for exascale HPC";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs, ... }:
  let system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
  in  {
    packages.${system}.default = pkgs.callPackage ./default.nix { };
  };
}

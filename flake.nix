{
description = "Home Manager configuration of justinhunkele";

inputs = {
  nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
  home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
  nix-darwin = { url = "github:lnl7/nix-darwin"; inputs.nixpkgs.follows = "nixpkgs"; };
};

outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ... }:
  let
    system = builtins.currentSystem;   
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
   # "M1-macOS" host nix-darwin configuration
   darwinConfigurations."M1-macOS" = nix-darwin.lib.darwinSystem {
     inherit pkgs;
     modules = [
       ./darwin.nix
       home-manager.darwinModules.home-manager
       {
         home-manager.users.justinhunkele = import ./justinhunkele.nix;
       }
     ];
   };

  };
}

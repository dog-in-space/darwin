{ inputs, config, pkgs, home-manager, ... }:{

imports = [ ./home.nix ];

home.username = "justinhunkele";
home.homeDirectory = "/Users/justinhunkele";
home.stateVersion = "24.05";

}
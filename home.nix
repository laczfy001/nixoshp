{ inputs, pkgs, unstable, ... }:

{
  
  home.username = "laci";
  home.homeDirectory = "/home/laci";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
  ];


}


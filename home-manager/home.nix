# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [

    ./helix
    ./git
    ./shells/zsh
  ];


  home = {
    username = "monad";
    homeDirectory = "/home/monad";
  };



  # Enable Settings, will eventually use this for individual users but for now
  # i just want to get something working
  
  # ----- Git 
  
  my.git.enable = true;


  # ----- Enable Editors 

  my.editor.helix.enable = true;



  # ----- Terminals
  #
  #my.terminal.ghostty.enable = true;

  my.terminal.shells.zsh.enable = true;



  

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

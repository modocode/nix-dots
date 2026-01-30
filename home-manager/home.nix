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
    inputs.zen-browser.homeModules.twilight-official

    ./helix
    ./git
    ./shells/zsh
    ./xmonad/default.nix
    ./emacs
    ./terminals/ghostty
    ./terminals/zoxide
    ./communication

  ];


  home = {
    username = "monad";
    homeDirectory = "/home/monad";
  };



  # Enable Settings, will eventually use this for individual users but for now
  # i just want to get something working
  
  # ----- Git 
  
  my.git.enable = true;


  # ---- Zen browser
  programs.zen-browser.enable = true;


  # ----- Enable Editors 

  my.editor.helix.enable = true;
  my.editor.emacs.enable = true; 



  # ----- Terminals
  #
  my.terminal.ghostty.enable = true;

  my.terminal.shells.zsh.enable = true;

  my.terminal.zoxide.enable = true;


  
  # ---- Communications

  my.comms.enable = true;

  

  

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

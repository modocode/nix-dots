{config, pkgs, lib, ... }:
let
  cfg = config.my.terminal.ghostty;

in
{

  options.my.terminal.ghostty = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Ghostty Terminal";
    };
  };


  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "ayu";
        font-family = "Fantasque Nerd Font Mono Regular";
        font-size = 10;
        
      };
    };
    
  };


  
}

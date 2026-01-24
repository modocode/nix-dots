{config, pkgs, lib, ... }:
let
  cfg = config.my.terminal.zoxide;

in
{

  options.my.terminal.zoxide = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Ghostty Terminal";
    };
  };


config = lib.mkIf cfg.enable {

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  
};
  

}

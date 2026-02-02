{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.my.terminal.shells.zsh;

in
{
  options.my.music = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Music Production Programs";

    };


  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.ardour	  
      pkgs.yabridge
      pkgs.yabridgectl

    ];


  }


}

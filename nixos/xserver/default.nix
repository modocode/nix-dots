{
  pkgs,
  config,
  lib,
  ...
}:
  let
    cfg = config.my.desktop;
  

  in
  {

    imports = [
      ./kde
      ./xmonad
    ];
    
    options.my.desktop = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "enable Window Manager";

      };

      manager = lib.mkOption {
        type = lib.types.enum ["kde" "xmonad" null];
        default = null;
        description = "Desktop/Window Manager Settings";
      };
    };


    #TODO Configure Tileing Window Managers Like Niri/Hyprland 

    config = lib.mkIf cfg.enable {
      my.desktop.kde.enable = lib.mkIf (config.my.desktop.manager == "kde") true;
      my.desktop.xmonad.enable = lib.mkIf (config.my.desktop.manager == "xmonad") true;
    };
  }
  

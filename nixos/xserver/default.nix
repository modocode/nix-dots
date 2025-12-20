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
    options.my.desktop = {
      enable = lib.mkOption {
        type = lib.types.enum ["kde" "xmonad" null];
        default = "kde";
        description = "Desktop/Window Manager Settings";
      };
    };


    #TODO Configure Tileing Window Managers Like Niri/Hyprland 

    config = lib.mkIf cfg.enable {
      my.desktop.kde.enable = lib.mkIf (config.my.desktop == "kde") true;
      my.desktop.xmonad.enable = lib.mkIf (config.my.desktop == "xmonad") true;
    };
  }
  

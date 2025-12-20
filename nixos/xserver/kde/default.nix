{pkgs, config, lib, ...}:

let
  cfg = config.my.desktop.kde;

in
  {
    options.my.desktop.kde = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "enable KDE Desktop Manager";  
      };
    };

    config = lib.mkIf cfg.enable {
      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.xserver.desktopManager = {
        plasma6 = {
          enable = true;
        };

      };

      services.displayManager.sddm.wayland.enable = true;
      



      
      # TODO: Configure plasma-manager (home-manager config of plasma)
      # Plasma-manager options: https://nix-community.github.io/plasma-manager/options.xhtml
      # programs.plasma = {
      #   enable = true;
      # };
    };
  }

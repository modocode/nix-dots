{lib, pkgs , config, ...}:
{

  imports = [
    #./xmonad.nix
  ];
 
  services = {
    
    xserver = {
        enable = true;
        autorun = true;
        autoRepeatDelay = 200;
        autoRepeatInterval = 35;
        desktopManager = {
          xfce = {
            enable = true;
            enableXfwm = true; 
          };
        };
        windowManager = {
          xmonad = {
            enable = false;
           # enableContribAndExtras= true;
           # extraPackages = haskellPackages : [
           #   haskellPackages.xmonad-contrib
           #   haskellPackages.xmonad-extras
           #   haskellPackages.xmonad
           # ];
        
          };
        };
      };
        displayManager = {
          ly = {
            enable = true;
          };
        };
      
};
  services.displayManager.defaultSession = "xfce";
  programs.thunar.enable = true;
}

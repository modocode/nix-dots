{config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    alacritty
    git
    tree
    dmenu
    peazip
  ];
  programs.firefox = {
		enable = true; 
  };
}

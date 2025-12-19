{config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    alacritty
    git
    keyd
    tree
    dmenu
    peazip
    direnv
  ];
  programs.firefox = {
		enable = true; 
  };
}

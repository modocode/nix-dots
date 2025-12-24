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
    ocs-url
  ];
  programs.firefox = {
		enable = true; 
  };
}

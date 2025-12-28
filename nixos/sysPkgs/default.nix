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


    #compilers
    gcc
    clang_20



    # Dictionaries
    hunspell
    hunspellDicts.en-us
    aspell
    aspellDicts.en
    
  ];
  programs.firefox = {
		enable = true; 
  };
}

{config,inputs, lib, pkgs, callPackage, ...}:
{

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })


      # Emacs Overlay
      # (import (builtins.fetchTarball {
      # url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      # sha256 = "sha256-1iGpbrxKzvF7Ppn8mG86m79CcfvOzYNG3qzlDCXQolg=";

    # }))
      
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };
  
}

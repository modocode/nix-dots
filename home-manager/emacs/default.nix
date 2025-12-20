{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.my.editor.emacs;
	repoPath = "${config.home.homeDirectory}/dots/home-manager";
	emacsConfigPath = "{repoPath}/emacs/config";
in
{
  options.my.editor.emacs = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Emacs Editor";
    };

  };

  config = lib.mkIf cfg.enable {
    services.emacs.enable = true;
    services.emacs.defaultEditor = true;
    services.emacs.package = pkgs.emacs-pgtk;
    programs.emacs = {
      enable = true;
    };

      home.packages = with pkgs; [
        (pkgs.emacsWithPackagesFromUsePackage {
          config = "./config/init.el";
          package = pkgs.emacs-pgtk;
          alwaysEnsure = false;
          extraEmacsPackages =
            epkgs: with epkgs; [
              corfu
              vertico
              orderless
              evil
              evil-collection
              evil-snipe
              evil-owl
              evil-vimish-fold
              direnv
              yasnippet
              magit
              magit-todos
              nix-mode
              python
              python-mode
              lsp-mode
              flycheck
              lsp-ui

            ];
        }

        )
      ];
     xdg.configFile."emacs".source = config.lib.file.mkOutofStoreSymlink emacsConfigPath;
  };
}

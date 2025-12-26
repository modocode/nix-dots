{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.my.editor.emacs;
	repoPath = "${config.home.homeDirectory}/dots/home-manager";
	emacsConfigPath = "${repoPath}/emacs/config";
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
			package = pkgs.emacs-pgtk;
    };

     #xdg.configFile."emacs".source = config.lib.file.mkOutOfStoreSymlink emacsConfigPath;
  };
}

{config, pkgs, lib, ... }:

let 
	cfg = config.my.editor.helix;
	repoPath = "${config.home.homeDirectory}/dots/home-manager";
  helixConfigPath = "${repoPath}/helix/config";

in 
{

	# TODO for now, helix will be the only editor i will install.
	# but i will add more editor later 
	options.my.editor.helix = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable Helix Text Editor";
		};
	};


	config = lib.mkIf cfg.enable {
		programs.helix = {
    # Manage Installation with nix 
		enable = true;
		# Configure Languages with Nix, Will likely be using nix shells for development so i 
		# wont need to install to many here


		package = pkgs.helix;
		
		extraPackages = with pkgs; [
			marksman
			nil
			nodePackages.bash-language-server
		];
	 

  };
	xdg.configFile."helix".source = config.lib.file.mkOutOfStoreSymlink helixConfigPath;	
	};
	

}

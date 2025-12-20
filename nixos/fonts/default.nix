{config, lib, pkgs, ...}:
{

	fonts = {
		enableDefaultPackages = true; 
		packages = with pkgs; [
			nerd-fonts.fantasque-sans-mono
			nerd-fonts.jetbrains-mono
			ibm-plex
			
		];

		fontconfig = {
			defaultFonts = {
				serif = [];
				sansSerif = [];
				monospace = [ "fantasque-sans-mono" "jetbrains-mono" ] ;
			};
		};
		fontDir.enable = true;
	};




}


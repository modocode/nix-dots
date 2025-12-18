{config, lib, pkgs, ...}:
{

	fonts = {
		enableDefaultPackages = true; 
		packages = with pkgs; [
			nerd-fonts.fantasque-sans-mono
			ibm-plex
			
		];

		fontconfig = {
			defaultFonts = {
				serif = [];
				sansSerif = [];
				monospace = [ "fantasque-sans-mono" ] ;
			};
		};
		fontDir.enable = true;
	};




}


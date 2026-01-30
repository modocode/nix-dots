{config, pkgs, lib, ... }:

let 
	cfg = config.my.comms;
in

{
	options.my.comms = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "Enable My Communication Apps";
		};
	};

	config = lib.mkIf cfg.enable {
    programs.discord = {
      enable = true;
    };

  };
}

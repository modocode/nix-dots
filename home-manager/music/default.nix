{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.my.music;

in
{
  options.my.music = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Music Production Programs";

    };
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      ardour
      yabridge
      yabridgectl

    ];

  };
}

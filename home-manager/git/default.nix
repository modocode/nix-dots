{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.my.git;
  repoPath = "${config.home.homeDirectory}/dots/home-manager";
in
{
  options.my.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable git";
    };
  };

  config = lib.mkIf cfg.enable {

    programs.git = {
      enable = true;
      userName = "modocode";
      userEmail = "colonialmediax@gmail.com";
      settings = {
        core = {
          compression = 7;
          whitespace = "trailing-space";
          preloadindex = true;         
        };

        url = {
          "git@github.com:" = {
            insteadOf = "gh:";
          };

          #
          #"ssh://git@host" = {
          #  insteadOf = "hostname:";
          # }
          
        };
 
        
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
      includes = [
        { path = "${repoPath}/git/git-extras.conf"; }
      ];

    };

    programs.gh = {
      enable = true;
      extensions = [
        pkgs.gh-dash

      ];
      settings = {
        aliases = {
          co = "pr checkout";
          st = "status";
          cl = "repo clone";
          cr = "repo create";
          is = "issue list --repo";
          pr = "pr lisr --repo";
          pra = "pr lisr --author";
          da = "dash";

        };
      };
    };

    programs.gh-dash = {
      enable = true;
      settings = {
        prSections = [
          {
            title = "My Pull Requests";
            filters = "is:open author:@me";
          }
          {
            title = "Subsribed";
            filters = "\
            repo:Nixos/nixpkgs\
            ";
          }
        ];
        issuesSections = [
          {
            title = "Created";
            filters = "is:open author:@me";
          }
          {
            title = "Assigned";
            filters = "is:open assignee:@me";
          }

        ];

        repoPaths = {
          "monad/*" = "~/code/personal";

        };

        keybindings = {
          universal = [
            {
              key = "g";
              commanad = "cd {{.repopath}} && lazygit";
            }

          ];

        };

      };

    };

    programs.lazygit = {
      enable = true;
      settings = {
        gui.theme = {
          lightTheme = true;
          activeBorderColor = [ "blue" "bold" ];
          inactiveBorderColor = [ "black" ];
          selectedLineBgColor = [ "default" ];
        };

      };
    };
  };

}

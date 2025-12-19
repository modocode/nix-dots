{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.my.terminal.shells.zsh;
  repoPath = "${config.home.homeDirectory}/dots/home-manager";
  zshConfigPath = "${repoPath}/shells/zsh";

  myShellAliases = {
    ll = "eza --icons --group-directories-first -l";
    ls = "eza --icons --group-directories-first";
    la = "eza --icons --group-directories-first -la";
    lg = "eza --icons --group-directories-first -la --git";
    lt = "eza --icons --tree --level=2";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    ns = "nh os switch . -H";
    nc = "nh clean all";
  };
in
{
  options.my.terminal.shells.zsh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Zsh";

    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=#6272a4,bg=none,bold,underline";
      };

      shellAliases = myShellAliases;

        # PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
        # %F{green}→%f "
        # RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
        # [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

      initExtra = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        bindkey '^P' history-beginning-search-backward
        bindkey '^N' history-beginning-search-forward
      '';

      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "regexp"
          "root"
          "line"
        ];

      };

      history = {
        ignoreDups = true;
        save = 10000;
        size = 10000;
      };

      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
      };

      antidote = {
        enable = true;
        plugins = [
          "chisui/zsh-nix-shell"
          "Aloxaf/fzf-tab"
          "MichaelAquilina/zsh-you-should-use"
          "nix-community/nix-zsh-completions"

        ];
      };

    };

    xdg.configFile."zshrc".source = config.lib.file.mkOutOfStoreSymlink zshConfigPath;

    home.packages = with pkgs; [
      eza
      bat
      fd
      bottom
      fzf
    ];
  };

}

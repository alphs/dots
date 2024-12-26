{ config,
  pkgs,
  nonicons,
  ...
}:

{
  home.username = "aaa";
  home.homeDirectory = "/home/aaa";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  #TODO: fix completions for these
  home.packages = [
    pkgs.git
    pkgs.tmux # check if tmux is static compiled, e.g.
    #   readelf -d $(realpath $(which ~/.nix-profile/bin/tmux)) | grep -E "NEEDED|RUNPATH"
    #   or
    #   ldd $(realpath $(which ~/.nix-profile/bin/tmux))
    # tmux is not statically compiled,
    # but it shouldn't be a very big issue due to how nix works
    pkgs.neovim-unwrapped
    pkgs.starship
    pkgs.wezterm
    pkgs.fd
    pkgs.ripgrep
    pkgs.fzf
    pkgs.glow
    pkgs.bat
    pkgs.zoxide
    pkgs.lsd
    pkgs.nix-zsh-completions
    pkgs.zsh
    pkgs.lazygit

    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    nonicons
  ];

  # ---
  home.file = {
    ".zshenv" = {
      enable = true;
      source = ./zsh/.zshenv;
    };

    ".zshrc".enable = false;
  };

  xdg.configFile = {
    # "zsh" = {
    #   enable = true;
    #   source = ./zsh; # this is not used due to $ZDOTDIR=$CONFIG_DOTS/zsh
    # };
    # ---
    "tmux" = {
      enable = true;
      source = ./tmux;
    };
    # ---
    # "starship" = {
    #   enable = true;
    #   source = ./starship; # this is not used due to STARSHIP_CONFIG="$CONFIG_DOTS/starship/starship.toml"
    # };
    # ---
    "git" = {
      enable = true;
      source = ./git;
    };
    # ---
    "wezterm" = {
      enable = true;
      source = ./wezterm;
    };
    # ---
    "ghostty" = {
      enable = true;
      source = ./ghostty;
    };
    # ---
    # # "nvim" = {
    # #   enable = true;
    # #   source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/dots/nvim"; # this requires --impure
    # # };
    # ---
  };


  # https://github.com/nix-community/home-manager/issues/4692#issuecomment-2013218118
  home.activation = {
    updateLinks = ''
      ln -s ${config.xdg.configHome}/dots/nvim .config/nvim
    '';
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aaa/etc/profile.d/hm-session-vars.sh
  #

  # home.sessionVariables = {
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

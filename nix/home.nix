# nix/home.nix
{ config, options, pkgs, lib, isNixos ? false, isWsl ? false, user, ... }:
#let
#  inherit isNixos user;
#in
{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  # home.profileDirectory = "${config.home.homeDirectory}/.nix-profile";
  home.preferXdgDirectories = true;

  xdg.enable = true;
  xdg.cacheHome  = "${config.home.homeDirectory}/.cache";
  xdg.configHome = "${config.home.homeDirectory}/.config";
  xdg.dataHome   = "${config.home.homeDirectory}/.local/share";
  xdg.stateHome  = "${config.home.homeDirectory}/.local/state";
  xdg.desktopEntries = { };
  #xdg.desktopEntries

  # programs.zsh.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # (lib.mkIf isNixos ...)
    (neovim.override { extraName = "stable"; })
    git
    tmux
    starship
    fd
    ripgrep
    fzf
    bat
    zoxide
    lsd
    nix-zsh-completions
    zsh
    lazygit
    jq
    gdb
    ghostty
    clang
    zig
    delta
    python3
    htop

    # Fonts
    nerd-fonts.jetbrains-mono
    nonicons
  ];

  xdg.configFile."nix".enable = true;
  xdg.configFile."nix".source = ./nix.conf;

  home.file.".zshenv".enable = true;
  home.file.".zshenv".source = ../zsh/.zshenv;
  # home.file.".zshrc".enable = false;

  ## this is not used due to $ZDOTDIR in zshenv above
  #xdg.configFile."zsh".enabled = true;
  #xdg.configFile."zsh".source = ../zsh;

  ## this is not used to $STARSHIP_CONFIG=CONFIG_DOTS/starship/starship.toml
  #xdg.configFile."starship".enable = true;
  #xdg.configFile."starship".source = ../starship;

  xdg.configFile."tmux".enable = true;
  xdg.configFile."tmux".source = ../tmux;

  xdg.configFile."git".enable = true;
  xdg.configFile."git".source = ../git;

  xdg.configFile."wezterm".enable = true;
  xdg.configFile."wezterm".source = ../wezterm;

  xdg.configFile."ghostty".enable = true;
  xdg.configFile."ghostty".source = ../ghostty;

  #xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/dots/nvim";

  home.activation = {
    nvim_link  = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run ln -sf $VERBOSE_ARG \
      ${config.xdg.configHome}/dots/nvim ${config.xdg.configHome}/nvim 
    '';
    wslg_wayland_socket_fix = if isWsl then
      lib.hm.dag.entryAfter ["writeBoundary"] ''
        run ln -sf $VERBOSE_ARG \
        /mnt/wslg/runtime-dir/wayland-* $XDG_RUNTIME_DIR/
      ''
    else "";
  };

  # home.sessionVariables = {
  #   # EDITOR = "emacs";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}

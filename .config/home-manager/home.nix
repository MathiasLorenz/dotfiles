# https://nix-community.github.io/home-manager/

{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mlorenz";
  home.homeDirectory = "/home/mlorenz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    btop
    zathura
    zoxide
    fish
    wl-clipboard
    wget
    bitwarden-desktop
    bat
    nix-zsh-completions
    curl
    fastfetch
    fd
    ncdu
    vim
    neovim
    wl-clipboard
    fzf
    ripgrep
    go-task
    starship
    gawk
    # zplug # This needs some more setup, probably easiest for now to download manually
    tldr
    stow
    kdePackages.plasma-wayland-protocols # needed to launch KDE plasma with Wayland
    unzip
    nodejs_23
    magic-wormhole

    slack
    _1password-gui

    gcc
    lua
    luarocks
    uv
    rustup
 
    git # pacman still has git installed for pacman itself I am quite sure
    paru

    # This does not work currently :(
    # containerd
    # docker
    # docker-buildx
    # dive

    # Currently I can't get sway to work with home-manager
    # The problem is that wlroots can't launch as it is looking for 
    # EGL extensions (OpenGL)
    # Should be fixable... For now sway can be installed with pacman/paru
    # nixGL https://github.com/nix-community/nixGL should definitly be able to solve the issue
    # but I cannot get it to work....
    # This should be the same for all gpu powered programs (like ghostty I suppose)
    # sway
    # ghostty

    # The sway 'downstream' dependencies can still be installed with home-manager
    swaybg
    swayidle
    # swaylock # Even when using the correct password I can't unluck with this - it works if installed with pacman..
    waybar
    mako
    swayimg

    gh
    hub
    lazygit

    wlr-randr
    rofi

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  # };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "slack"
      "1password"
    ];
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
  #  /etc/profiles/per-user/mlorenz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment

    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    diffsitter # Better diff
    jq # JSON pretty printer and manipulator
    # trekscii # Cute startrek cli printer
    timer # To help with my ADHD paralysis

    nil # Nix LSP
    alejandra # Nix formatter
    nvd # Differ
    nix-output-monitor
    # nh # Nice wrapper for NixOS and HM

    ltex-ls # Spell checking LSP

    # tly # Tally counter

    # awscli2
    # inputs.awscli-console.default
  ];

  # programs.neovim = {
  #   enable = true;
  # };

  programs.zsh = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };

  home.file.".config/fish" = {
    source = ../../config/fish;
    target = ".config/fish";
    recursive = true;
    executable = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "zvasoup";
    userEmail = "zulfa.plank@proton.me";
    extraConfig = {init.defaultBranch = "main";};
  };

  programs.foot = {
    enable = true;
    server.enable = true;
  };
  home.file.".config/foot" = {
    source = ../../config/foot;
    target = ".config/foot";
    recursive = true;
    executable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.zathura = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };
  home.file.".config/yazi" = {
    source = ../../config/yazi;
    target = ".config/yazi";
    recursive = true;
    executable = true;
  };

  programs.mpv = {
    enable = true;
  };

  home.file.".config/zathura" = {
    source = ../../config/zathura;
    target = ".config/zathura";
    recursive = true;
    executable = true;
  };

  programs.yt-dlp = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    plugins = with pkgs; [
      tmuxPlugins.sensible
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };

  #   programs.hyprland = {
  #   enable = true;
  #   portalPackage = pkgs.xdg-desktop-portal-hyprland; # default
  # };
}

{pkgs, ...}: {
  imports = [
    ./fish/home.nix
    ./foot/home.nix
    ./yazi/home.nix
    ./tmux/home.nix
    ./zathura/home.nix
  ];

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
    nvd # Differ
    nix-output-monitor
    # nh # Nice wrapper for NixOS and HM
    texliveFull
    # tly # Tally counter
    # awscli2
    # inputs.awscli-console.default
    uget
    uget-integrator
    unzip
    # Utilities
    tree
    git
    fastfetch
    acpi
    glow
  ];

  programs.zsh = {
    enable = true;
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

  programs.ripgrep = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.mpv = {
    enable = true;
  };
}

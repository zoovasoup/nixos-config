{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    mouse = true;

    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.sensible
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}

if status is-interactive
  # cermic 1 ~/.cermic_repo/cermic-tiny-art-repo/images/sh_green.png -f
  # cermic 1 ~/.cermic_repo/cermic-tiny-art-repo/images
  set fish_greeting

  alias config="cd ~/.config"
  alias script="cd ~/.local/scripts"
  alias down="cd ~/Downloads"
  # alias ls="ls -l -a"
  alias ls="eza -l"
  alias lsa="eza -l -a"
  alias x="exit"
  alias floorp="flatpak run one.ablaze.floorp"
  alias keysoup="sudo systemctl restart keyd && sudo systemctl enable keyd && sudo systemctl start keyd && setxkbmap -option compose:menu "
  alias keysoupx="sudo systemctl restart keyd && sudo systemctl enable keyd && sudo systemctl start keyd && xset r rate 150 62 && setxkbmap -option compose:menu"
  alias luamake="/home/zva/lua-language-server/3rd/luamake/luamake"
  alias nv="nvim"
  alias eww="~/eww/target/release/eww"
  # alias cat="bat"
  # alias ct="cat"
  alias c="clear && cermic 1 ~/.cermic_repo/cermic-tiny-art-repo/images"
  alias yz="yazi"
  alias bt="bat --paging=never"
end

set -x PATH $PATH /home/zvasoup/.cargo/bin

function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

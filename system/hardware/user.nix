{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zvasoup = {
    isNormalUser = true;
    description = "zvasoup";
    extraGroups = [ "networkmanager" "wheel" "keyd" ];
    packages = with pkgs; [ ];
  };
}

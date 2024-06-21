{pkgs, ...}: {
  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    # dns = "systemd-resolved";
  };

  # services.resolved = {
  #   enable = true;
  #   dnsovertls = "true";
  #   extraConfig = "
  #     DNS=45.90.28.0#8f1153.dns.nextdns.io
  #     DNS=2a07:a8c0::#8f1153.dns.nextdns.io
  #     DNS=45.90.30.0#8f1153.dns.nextdns.io
  #     DNS=2a07:a8c1::#8f1153.dns.nextdns.io
  #     ";
  # };

  environment.systemPackages = with pkgs; [
    networkmanager
  ];

  services.nextdns = {
    enable = true;
    arguments = ["-config" "nixThinkpad-8f1153.dns.nextdns.io"];
  };
}

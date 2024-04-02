{ ... }: {
  services.nextdns = {
    enable = true;
    arguments = [ "-config" "nixThinkpad-8f1153.dns.nextdns.io" ];
  };
}

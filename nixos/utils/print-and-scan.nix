{pkgs, ...}: {
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;

    # printer drivers
    drivers = with pkgs; [
      gutenprint
      hplip
      brlaser
    ];
  };

  #enble scanner
  hardware.sane = {
    enable = true;

    #adding extra backend for epson
    extraBackends = [pkgs.epkowa];
  };
}

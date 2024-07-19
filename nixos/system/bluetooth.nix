{pkgs, ...}: let
  restartBluetoothScript = ''
    #!${pkgs.bash}/bin/bash
    ${pkgs.systemd}/bin/systemctl restart bluetooth.service
  '';
in {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        experimental = true;
      };
      AutoEnable = true;
    };
  };

  systemd.services.restart-bluetooth = {
    description = "Restart Bluetooth after resume";
    after = ["hibernate.target" "suspend.target" "sleep.target"];
    serviceConfig = {
      ExecStart = "${pkgs.writeScriptBin "restart-bluetooth" restartBluetoothScript}/bin/restart-bluetooth";
    };
    wantedBy = ["hibernate.target" "suspend.target" "sleep.target"];
  };
}

{...}: {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        experimental = true;
      };
    };
  };
}

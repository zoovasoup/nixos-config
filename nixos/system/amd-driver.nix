{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa # This includes the necessary VAAPI support for AMD GPUs.
      libGL
    ];
  };

  environment.systemPackages = with pkgs; [
    libva
    libva-utils
    amdvlk
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi"; # radeonsi is the VAAPI driver for AMD.
  };

  # To enable Vulkan support for 32-bit applications, also add:
  hardware.graphics.extraPackages32 = [
    pkgs.driversi686Linux.amdvlk
  ];

  # Force radv
  environment.variables.AMD_VULKAN_ICD = "RADV";
  # Or
  environment.variables.VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
}

{
  config,
  pkgs,
  ...
}: {
  programs.dconf.enable = true;

  # Adding the user to necessary groups for virtualization
  users.users.zvasoup.extraGroups = ["libvirtd" "kvm" "wheel" "libvirt" "libvirt-qemu"];

  # System packages to support virtualization, graphics, and USB tools
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    # gnome.adwaita-icon-theme
    amdvlk # AMD Vulkan driver for integrated graphics
    mesa # Open-source graphics driver for the integrated GPU
    usbutils # For managing and listing USB devices
  ];

  # Kernel parameters to enable IOMMU for AMD processors
  boot.kernelParams = ["amd_iommu=on" "iommu=pt"];

  # Enabling and configuring libvirt for virtualization
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true; # TPM support
        ovmf.enable = true; # UEFI firmware for VMs
        ovmf.packages = [pkgs.OVMFFull.fd]; # Full OVMF package for UEFI support
      };
    };
    spiceUSBRedirection.enable = true; # USB redirection support for SPICE
  };

  # Enabling SPICE agent for better guest interaction
  services.spice-vdagentd.enable = true;

  # Optional: Enable hardware acceleration with the AMDGPU driver
  hardware = {
    enableRedistributableFirmware = true;
    amdgpu.amdvlk.enable = true;
    amdgpu.opencl.enable = true;
    # opengl.enable = true;
  };

  # Enabling power management and performance optimizations for laptops
  powerManagement.cpuFreqGovernor = "ondemand";
  services.tlp.enable = true; # TLP power management for better battery life
}

{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware = {
    amdgpu.amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva
        libva-vdpau-driver
        libvdpau-va-gl
        mesa
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };
}

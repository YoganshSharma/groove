{pkgs, ...}: {
  environment.shells = with pkgs; [fish zsh bashInteractive];
  environment.systemPackages = with pkgs; [carapace fish zsh];
}

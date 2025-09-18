{inputs, ...}: {
  nixpkgs = {
    overlays = [inputs.kixvim.overlays.default];
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
}

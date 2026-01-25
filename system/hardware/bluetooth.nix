{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    settings = {
      # make Xbox Series X controller work
      General = {
        Experimental = true;
        FastConnectable = false;
        powerOnBoot = true;
        JustWorksRepairing = "always";
        Privacy = "device";


        # TEMPORARY WORKAROUND FOR BLUETOOTH AUDIO ISSUES
        Disable = "Headset";
        ControllerMode = "bredr";
      };
    };
  };

  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 '';
  systemd.user.services.telephony_client.enable = false;
}

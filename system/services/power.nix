{
  services = {
    logind.settings.Login = {
      HandlePowerKey = "suspend";
      HandleLidSwitch = "lock";
      HandleLidSwitchExternalPower = "lock";
    };

    power-profiles-daemon.enable = true;

    # battery info
    upower = {
      enable = true;
      percentageLow = 30;
      percentageCritical = 20;
      percentageAction = 10;
      criticalPowerAction = "Suspend";
      allowRiskyCriticalPowerAction = true;
      # TODO Notify on battery low/critical
      
    };
  };
}

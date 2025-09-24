evaluation warning: yogansh profile: `programs.ssh` default values will be removed in the future.
                    Consider setting `programs.ssh.enableDefaultConfig` to false,
                    and manually set the default values you want to keep at
                    `programs.ssh.matchBlocks."*"`.
evaluation warning: The option `services.logind.lidSwitchExternalPower' defined in `/nix/store/zxibxr9i71d3kd27bk7ys3wbg0jxiczv-source/system/services/power.nix' has been renamed to `services.logind.settings.Login.HandleLidSwitchExternalPower'.
evaluation warning: The option `services.logind.lidSwitch' defined in `/nix/store/zxibxr9i71d3kd27bk7ys3wbg0jxiczv-source/system/services/power.nix' has been renamed to `services.logind.settings.Login.HandleLidSwitch'.
evaluation warning: The option `services.logind.powerKey' defined in `/nix/store/zxibxr9i71d3kd27bk7ys3wbg0jxiczv-source/system/services/power.nix' has been renamed to `services.logind.settings.Login.HandlePowerKey'.


- [ ] Review and update `programs.ssh` configuration: Default values will be removed. Consider setting `programs.ssh.enableDefaultConfig` to `false` and manually defining desired values in `programs.ssh.matchBlocks."*"`.
- [X] Rename `services.logind.lidSwitchExternalPower` to `services.logind.settings.Login.HandleLidSwitchExternalPower`.
- [X] Rename `services.logind.lidSwitch` to `services.logind.settings.Login.HandleLidSwitch`.
- [X] Rename `services.logind.powerKey` to `services.logind.settings.Login.HandlePowerKey`.
https://github.com/ActivityWatch/awesome-activitywatch?tab=readme-ov-file

- Calendar configure
https://github.com/kpbaks/nixos-config/blob/a99096c1775cd0c4eb7f56c1a1b74235868ef05a/home/calendar.nix#L11

- mpv copyToClipboard script custom pkg

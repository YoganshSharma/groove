# DMS IPC Reference

`dms ipc <target> <function> [args...]`

IPC targets and their functions available in DankMaterialShell. These are defined in QML via `IpcHandler` and queried dynamically at runtime.

## Targets & Functions

### `powermenu`
| Function | Description |
|---|---|
| `open` | Open power menu modal |
| `close` | Close power menu modal |
| `toggle` | Toggle power menu modal |

### `control-center`
| Function | Description |
|---|---|
| `open` | Open control center |
| `hide` | Hide control center |
| `toggle` | Toggle control center |
| `status` | Show visibility status |

### `spotlight` (alias: `launcher`)
| Function | Description |
|---|---|
| `open` | Open spotlight launcher |
| `close` | Close spotlight launcher |
| `toggle` | Toggle spotlight launcher |
| `openWith <mode>` | Open with specific mode |
| `toggleWith <mode>` | Toggle with specific mode |
| `openQuery <query>` | Open with pre-filled query |
| `toggleQuery <query>` | Toggle with pre-filled query |

### `clipboard`
| Function | Description |
|---|---|
| `open` | Open clipboard history |
| `close` | Close clipboard history |
| `toggle` | Toggle clipboard history |

### `settings`
| Function | Description |
|---|---|
| `open` | Open settings panel |
| `openWith <tab>` | Open with a specific tab |
| `close` | Close settings panel |
| `toggle` | Toggle settings panel |
| `toggleWith <tab>` | Toggle with specific tab |
| `focusOrToggle` | Focus or toggle settings |
| `focusOrToggleWith <tab>` | Focus or toggle with tab |
| `tabs` | List available setting tabs |
| `get <key>` | Get a settings value |
| `set <key> <value>` | Set a settings value |

### `processlist`
| Function | Description |
|---|---|
| `open` | Open process list |
| `close` | Close process list |
| `toggle` | Toggle process list |
| `focusOrToggle` | Focus or toggle process list |

### `bar`
| Function | Description |
|---|---|
| `reveal <selector> <value>` | Make bar visible |
| `hide <selector> <value>` | Hide bar |
| `toggle <selector> <value>` | Toggle bar visibility |
| `status <selector> <value>` | Check bar visibility status |
| `autoHide <selector> <value>` | Enable auto-hide |
| `manualHide <selector> <value>` | Disable auto-hide |
| `toggleAutoHide <selector> <value>` | Toggle auto-hide mode |
| `toggleReveal <selector> <value>` | Toggle reveal/tuck |
| `getPosition <selector> <value>` | Get bar position |
| `setPosition <selector> <value> <position>` | Set bar position |

Selector options: `id`, `name`, or `index`.

### `dock`
| Function | Description |
|---|---|
| `reveal` | Show dock |
| `hide` | Hide dock |
| `toggle` | Toggle dock |
| `status` | Check dock visibility |
| `autoHide` | Enable dock auto-hide |
| `manualHide` | Disable dock auto-hide |
| `toggleAutoHide` | Toggle auto-hide mode |

### `dash`
| Function | Description |
|---|---|
| `open [tab]` | Open dashboard (tab: media, wallpaper, weather) |
| `close` | Close dashboard |
| `toggle [tab]` | Toggle dashboard |

### `notepad`
| Function | Description |
|---|---|
| `open` | Open notepad |
| `close` | Close notepad |
| `toggle` | Toggle notepad |
| `expand` | Expand notepad width |
| `collapse` | Collapse notepad width |
| `toggleExpand` | Toggle expanded width |

### `inhibit`
| Function | Description |
|---|---|
| `toggle` | Toggle idle inhibit |
| `enable` | Enable idle inhibit |
| `disable` | Disable idle inhibit |
| `status` | Check idle inhibit status |
| `reason [text]` | Get or set inhibit reason |

### `mpris`
| Function | Description |
|---|---|
| `list` | List available MPRIS players |
| `play` | Play |
| `pause` | Pause |
| `playPause` | Toggle play/pause |
| `previous` | Previous track |
| `next` | Next track |
| `stop` | Stop |
| `increment <step>` | Increase volume by step (default 5) |
| `decrement <step>` | Decrease volume by step (default 5) |
| `setvolume <percent>` | Set volume to percentage |

### `keybinds`
| Function | Description |
|---|---|
| `toggle <provider>` | Toggle keybind cheatsheet |
| `toggleWithPath <provider> <path>` | Toggle with config path |
| `open <provider>` | Open keybind cheatsheet |
| `openWithPath <provider> <path>` | Open with config path |
| `close` | Close keybind cheatsheet |

### `outputs`
| Function | Description |
|---|---|
| `listProfiles` | List display profiles |
| `setProfile <name>` | Activate display profile |
| `cycleProfile` | Cycle to next profile |
| `toggleAuto` | Toggle auto-profile selection |
| `status` | Display profile status |
| `current` | Show current output state |
| `refresh` | Refresh output state |

### `mic`
| Function | Description |
|---|---|
| `setvolume <percent>` | Set microphone volume |
| `increment <step>` | Increase mic volume |
| `decrement <step>` | Decrease mic volume |
| `mute` | Toggle mic mute |
| `status` | Mic status |

### `powerprofile`
| Function | Description |
|---|---|
| `open` | Open power profile modal |
| `close` | Close power profile modal |
| `toggle` | Toggle power profile modal |
| `list` | List available profiles |
| `status` | Show active profile |
| `set <profile>` | Set power profile |
| `cycle` | Cycle to next profile |

### `widget`
| Function | Description |
|---|---|
| `toggle <id>` | Toggle a widget popout |
| `openWith <id> <mode>` | Open widget with mode |
| `toggleWith <id> <mode>` | Toggle widget with mode |
| `openQuery <id> <query>` | Open widget with query |
| `toggleQuery <id> <query>` | Toggle widget with query |
| `list` | List registered widgets |
| `status <id>` | Widget visibility status |
| `reveal <id>` | Force show a widget |
| `hide <id>` | Force hide a widget |
| `reset <id>` | Reset widget visibility |
| `visibility <id>` | Effective visibility |

### `tray`
| Function | Description |
|---|---|
| `list` | List system tray items |
| `activate <id>` | Activate a tray item |
| `status <id>` | Tray item details |

### `plugins`
| Function | Description |
|---|---|
| `reload <id>` | Reload a plugin |
| `enable <id>` | Enable a plugin |
| `disable <id>` | Disable a plugin |
| `toggle <id>` | Toggle a plugin |
| `list` | List available plugins |
| `status <id>` | Plugin load status |

### `systemupdater`
| Function | Description |
|---|---|
| `toggle` | Toggle system updater |
| `open` | Open system updater |
| `close` | Close system updater |
| `updatestatus` | Check for updates |

### `screenshot`
| Function | Description |
|---|---|
| `begin` | Enter screenshot mode |
| `end` | Exit screenshot mode |

### `toast`
| Function | Description |
|---|---|
| `info <message>` | Show info toast |
| `warn <message>` | Show warning toast |
| `error <message>` | Show error toast |
| `hide` | Hide current toast |
| `dismiss <category>` | Dismiss category |
| `status` | Toast visibility |

### `defaultApp`
| Function | Description |
|---|---|
| `browser` | Launch default browser |
| `fileManager` | Launch default file manager |
| `textEditor` | Launch default text editor |
| `imageViewer` | Launch default image viewer |
| `videoPlayer` | Launch default video player |
| `musicPlayer` | Launch default music player |
| `pdfReader` | Launch default PDF reader |
| `mail` | Launch default mail client |
| `calendar` | Launch default calendar |

### Other targets
| Target | Functions |
|---|---|
| `desktopWidget` | `toggleOverlay`, `setOverlay`, `list`, `status`, `enable`, `disable`, `toggleEnabled`, `toggleClickThrough`, `setClickThrough`, `toggleSyncPosition`, `setSyncPosition` |
| `dankdash` | `wallpaper` |
| `file` | `browse` (wallpaper/profile) |
| `hypr` | Hyprland-specific: `openBinds`, `closeBinds`, `toggleBinds`, `toggleOverview`, `closeOverview`, `openOverview` |
| `spotlight-bar` | `open`, `close`, `toggle` |
| `welcome` | `open`, `doctor`, `page` |
| `workspace-rename` | `open`, `close`, `toggle` |
| `window-rules` | `open`, `close`, `toggle` |

> **Note:** There is no `notifications` IPC target in current DMS. Use `control-center toggle` as the closest equivalent for notification center access.

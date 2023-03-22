local wezterm = require('wezterm')
return {
    font = wezterm.font('ComicMono NF'),
    color_scheme = 'EverforestDark (Gogh)',
    launch_menu = {
        {
            args = { 'btop' }
        },
        {
            label = 'SSH into oldsoul',
            args = { 'ssh', 'oldsoul@192.168.1.26' }
        },
        {
            label = 'SSH into minecraft',
            args = { 'ssh', 'minecraft@192.168.1.26' }
        },
    },
    keys = {
        { key = 'n', mods = 'CTRL|ALT', action = wezterm.action.ShowLauncher },
    }
}

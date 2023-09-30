local wezterm = require('wezterm')
return {
    font = wezterm.font('FiraCode Nerd Font Mono'),
    color_scheme = 'EverforestDark (Gogh)',
    launch_menu = {
        {
            args = { 'btop' }
        },
        {
            label = 'SSH into CasaOS',
            args = { 'ssh', 'casaos@192.168.1.4' }
        }
        -- {
        --     label = 'SSH into oldsoul',
        --     args = { 'ssh', 'oldsoul@192.168.1.26' }
        -- },
        -- {
        --     label = 'SSH into minecraft',
        --     args = { 'ssh', 'minecraft@192.168.1.26' }
        -- },
    },
    keys = {
        { key = 'n', mods = 'CTRL|ALT', action = wezterm.action.ShowLauncher },
    }
}

local wezterm = require('wezterm')

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local palette = config.resolved_palette.tab_bar
  local colors = {
    bg = palette.background,
    tab = tab.is_active and palette.active_tab.bg_color or palette.inactive_tab.bg_color,
    fg = tab.is_active and palette.active_tab.fg_color or palette.inactive_tab.fg_color,
  }

  return {
    { Background = { Color = colors.tab } },
    { Foreground = { Color = colors.fg } },
    { Text = tab.active_pane.title },
  }
end)

return {
    hide_tab_bar_if_only_one_tab = true,
    window_background_opacity = 0.67,
    font = wezterm.font_with_fallback({
        -- {
        --     family = "Monaspace Neon",
        --     harfbuzz_features = { 'ss01=1', 'ss02=1', 'ss03=1', 'ss04=1', 'ss05=1', 'ss07=1', 'calt=1' },
        -- },
        -- {
        --     family = "Intel One Mono",
        --     harfbuzz_features = { 'ss11=1' }
        -- },
        "ComicShannsMono Nerd Font Mono",
        "Symbols Nerd Font",
        "Noto Color Emoji" -- emoji fonts :D
    }),
    font_size = 14,
    color_scheme = "everforest";
    keys = {
        { key = "n", mods = "CTRL|ALT", action = wezterm.action.ShowLauncher },
        { key = "|", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal },
        { key = "_", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical },
    },
    window_frame = {
        active_titlebar_bg = "#1e2326",
        inactive_titlebar_bg = "#1e2326",
        font = wezterm.font {           
            family = "ComicShannsMono Nerd Font Propo",
            weight = "Bold"
        }
    },
    colors = {
        tab_bar = {
            active_tab = {
                bg_color = "#2e383c",
                fg_color = "#d3c6aa",
            },
            inactive_tab = {
                bg_color = "#1e2326",
                fg_color = "#859289",
            },
            inactive_tab_hover = {
                bg_color = "#272e33",
                fg_color = "#859289",
            },
            new_tab = {
                bg_color = "#1e2326",
                fg_color = "#1e2326",
            },
            new_tab_hover = {
                bg_color = "#1e2326",
                fg_color = "#859289",
            },
        }
    }
}

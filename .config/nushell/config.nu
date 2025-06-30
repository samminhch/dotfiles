#=========================#
# Configuration Overrides #
#=========================#
$env.config.show_banner = false
$env.config.rm.always_trash = true
$env.config.completions.algorithm = "fuzzy"
$env.config.display_errors.exit_code = true
$env.config.footer_mode = "auto"
$env.config.filesize.unit = "binary"
$env.config.edit_mode = "vi"
$env.config.cursor_shape = {
    vi_insert: "blink_line"
    vi_normal: "block"
}

#-----------------------#
# Nushell Custom Prompt #
#-----------------------#

let rev_color = {|escape: record<fg: string, bg: string>| {fg: $escape.bg, bg: $escape.fg}}
let pill_text = {
    |text: string, highlight_color: record<fg: string, bg: string>|
    $"(ansi -e (do $rev_color $highlight_color))(ansi -e $highlight_color)($text)(ansi -e (do $rev_color $highlight_color))(ansi reset)"
}

let segment_colors = {
    user: (if (is-admin) {"red"} else {"cyan"})
    dir: blue
    git: purple,
    time: yellow,
    error: red
}

# Set delay to get the final terminal size
sleep 0.125sec
$env.PROMPT_COMMAND = {||
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let user_segment = do $pill_text $"($env.USER)@(sys host | get hostname)" {fg: black, bg: $segment_colors.user}
    let path_segment = do $pill_text $dir {fg: black, bg: $segment_colors.dir}
    let left_segment = $"╭($user_segment)─($path_segment)" | str trim
    let left_segment_length = $left_segment | str replace --all --regex "\\x1b\\[[0-9;]*m" "" | str length -g

    let git_segment = if (git status ^ null | complete | get exit_code | $in == 0) {
        do $pill_text $"(git branch --show-current)" {fg:black, bg: $segment_colors.git}
    } else {""}

    let time_segment = do $pill_text (date now | format date '%T') {fg: black, bg: $segment_colors.time}
    let error_segment = if ($env.LAST_EXIT_CODE != 0) {
        do $pill_text ($env.LAST_EXIT_CODE | into string) {fg: black, bg: $segment_colors.error}
    } else { "" }

    let right_segment = (
        [
            $error_segment (if (($error_segment | str length) > 0) {"─"} else {""})
            $git_segment (if (($git_segment | str length) > 0) {"─"} else {""})
            $time_segment
            (if ($env.TERM == "linux") {"─*"} else {"─"})
        ] | str join
    )

    return (
        [
            (ansi reset)
            $left_segment
            ($"($right_segment)" | fill -a "r" -c "─" -w ((term size).columns - ($left_segment_length)))
            "\n╰─"
        ] | str join
    )
}

$env.PROMPT_COMMAND_RIGHT = ""

$env.PROMPT_INDICATOR = if ($env.TERM == "linux") {"> "} else {" "}
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi cyan)($env.PROMPT_INDICATOR)(ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi white)($env.PROMPT_INDICATOR_VI_NORMAL)(ansi reset)"

            
$env.TRANSIENT_PROMPT_COMMAND = { ||
    ([
        (ansi reset) "╭"
        (
            (if ($env.TERM == "linux") {"─*\n╰─"} else {$"─\n╰─"})
            | fill -a "r" -c "─" -w ((term size).columns + 2)
        )
        ""
    ] | str join)  
}
$env.TRANSIENT_PROMPT_INDICATOR           = $env.PROMPT_INDICATOR
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = $"(ansi cyan)($env.TRANSIENT_PROMPT_INDICATOR)(ansi reset)"
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = $"(ansi white)($env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL)(ansi reset)" 


#=========================#
# Import External Modules #
#=========================#
use ./utils.nu *
use std/util "path add"

#=============#
# Update PATH #
#=============#
if (is_installed "cargo") {
    path add $"($env.HOME)/.cargo/bin"
}

#===================#
# Configure Plugins #
#===================#
$env.config.plugins = {
    highlight: {
        custom_themes: $"($env.HOME)/.config/bat/themes/"
        theme: evergarden-winter
    }
}

#========#
# Extras #
#========#
# Fastfetch
if (is_installed "fastfetch") {
    fastfetch
}


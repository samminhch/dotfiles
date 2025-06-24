# Check if some command available in current shell
export def is_installed [ app: string ] {
  ((which $app | length) > 0)
}

export def print_tagged [annotation: string, message: string] {
    let annot_upcase = $annotation | str upcase
    echo $"(
        match ($annot_upcase) 
        {
            "INFO" => $"(ansi blue_bold)"
            "OKAY" => $"(ansi green_bold)"
            "WARN" => $"(ansi yellow_bold)"
            "ERROR" => $"(ansi red_bold)"
            _ => ""
        } )[($annot_upcase)](ansi reset) ($message)"
}

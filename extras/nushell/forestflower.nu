# Forest Flower — Nushell color theme
# GENERATED from DESIGN.md by scripts/generate.mjs — do not edit by hand.
#
# Provides two exported commands that return a Nushell `color_config` record:
#   (forestflower-day)   -> light variant
#   (forestflower-night) -> dark variant
#
# Usage in config.nu:
#   use ~/.config/nushell/forestflower.nu *
#   $env.config.color_config = (forestflower-night)

def make-theme [palette: record]: nothing -> record {
  {
    separator: $palette.surface_raised
    leading_trailing_space_bg: $palette.surface_raised
    header: { fg: $palette.secondary attr: b }
    empty: { fg: $palette.info }
    row_index: { fg: $palette.muted }
    hints: { fg: $palette.subtle }
    bool: {|x| if $x { $palette.success } else { $palette.error } }
    int: { fg: $palette.syntax_number attr: b }
    float: { fg: $palette.syntax_number attr: b }
    duration: { fg: $palette.syntax_function }
    range: { fg: $palette.syntax_function }
    string: { fg: $palette.syntax_string }
    nothing: { fg: $palette.muted }
    binary: { fg: $palette.error }
    cell-path: { fg: $palette.syntax_string }
    datetime: { fg: $palette.syntax_type }
    filesize: { fg: $palette.syntax_type }

    shape_block: { fg: $palette.syntax_type attr: b }
    shape_bool: { fg: $palette.syntax_string }
    shape_custom: { attr: b }
    shape_external: { fg: $palette.syntax_string }
    shape_externalarg: { fg: $palette.syntax_keyword attr: b }
    shape_filepath: { fg: $palette.syntax_string }
    shape_flag: { fg: $palette.syntax_type attr: b }
    shape_float: { fg: $palette.syntax_number attr: b }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b }
    shape_globpattern: { fg: $palette.syntax_string attr: b }
    shape_int: { fg: $palette.syntax_number attr: b }
    shape_internalcall: { fg: $palette.syntax_string attr: b }
    shape_list: { fg: $palette.syntax_string attr: b }
    shape_literal: { fg: $palette.syntax_type }
    shape_operator: { fg: $palette.syntax_operator }
    shape_pipe: { fg: $palette.syntax_tag attr: b }
    shape_range: { fg: $palette.syntax_function attr: b }
    shape_record: { fg: $palette.syntax_string attr: b }
    shape_signature: { fg: $palette.syntax_keyword attr: b }
    shape_string: { fg: $palette.syntax_string }
    shape_string_interpolation: { fg: $palette.syntax_string attr: b }
    shape_table: { fg: $palette.syntax_type attr: b }
    shape_variable: { fg: $palette.syntax_tag }
  }
}

export def forestflower-night []: nothing -> record {
  make-theme {
    surface_raised: "#3D484D"
    secondary: "#BEC97E"
    info: "#92BFDB"
    muted: "#7A8478"
    subtle: "#969E95"
    success: "#BEC97E"
    error: "#F89A8A"
    syntax_number: "#A699D0"
    syntax_function: "#EC8B49"
    syntax_string: "#5ABDAC"
    syntax_type: "#66A0C8"
    syntax_keyword: "#A0AF54"
    syntax_tag: "#E47DA8"
    syntax_operator: "#878580"
  }
}

export def forestflower-day []: nothing -> record {
  make-theme {
    surface_raised: "#E6E2CC"
    secondary: "#4D6B0E"
    info: "#1A4F8C"
    muted: "#A6B0A0"
    subtle: "#829181"
    success: "#4D6B0E"
    error: "#942822"
    syntax_number: "#5E409D"
    syntax_function: "#BC5215"
    syntax_string: "#24837B"
    syntax_type: "#205EA6"
    syntax_keyword: "#66800B"
    syntax_tag: "#A02F6F"
    syntax_operator: "#878580"
  }
}
